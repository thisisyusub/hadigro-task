import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/bookings/bookings_cubit.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import '../about/about_page.dart';
import '../booking_scan/booking_scan_page.dart';
import '../bookings/bookings_page.dart';

final getIt = GetIt.instance;

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    _pageController.animateToPage(
      widget.index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

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
          children: const [
            BookingsPage(),
            BookingScanPage(),
            AboutPage(),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          pageController: _pageController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
