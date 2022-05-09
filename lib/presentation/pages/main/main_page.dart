import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/bookings/bookings_cubit.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import '../about/about_page.dart';
import '../bookings/bookings_page.dart';

final getIt = GetIt.instance;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<BookingsCubit>()..fetchBookings(),
        ),
      ],
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            const BookingsPage(),
            Scaffold(),
            const AboutPage(),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          pageController: _pageController,
        ),
      ),
    );
  }
}
