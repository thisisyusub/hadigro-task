import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'bloc/booking_details/booking_details_cubit.dart';
import 'bloc/login/login_cubit.dart';
import 'bloc/use_booking/use_booking_cubit.dart';
import 'pages/auth/auth_page.dart';
import 'pages/booking_details/booking_details_page.dart';
import 'pages/login/login_page.dart';
import 'pages/main/main_page.dart';

final getIt = GetIt.instance;

abstract class AppRoutes {
  static const auth = '/auth';
  static const main = '/main';
  static const String bookings = '$main/bookings';
  static const String scan = '$main/scan';
  static const String about = '$main/about';
  static const login = '/login';
  static const bookingDetails = '/bookingDetails';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.auth,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt.get<LoginCubit>(),
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: '${AppRoutes.main}/:subRoute',
      builder: (context, state) {
        final subRoute = state.params['subRoute']!;

        int index = 0;

        switch (subRoute) {
          case 'bookings':
            index = 0;
            break;
          case 'scan':
            index = 1;
            break;
          case 'about':
            index = 2;
            break;
        }

        return MainPage(key: state.pageKey, index: index);
      },
    ),
    GoRoute(
      path: AppRoutes.bookingDetails,
      name: AppRoutes.bookingDetails,
      builder: (context, state) {
        final showUseButton = state.queryParams.containsKey('showUseButton');

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt.get<BookingDetailsCubit>(
                param1: state.queryParams['bookingCode']!,
              )..fetchBookingDetails(),
            ),
            if (showUseButton)
              BlocProvider(
                create: (context) => getIt.get<UseBookingCubit>(
                    param1: state.queryParams['bookingCode']),
              ),
          ],
          child: BookingDetailPage(
            showSetToUseButton: showUseButton,
          ),
        );
      },
    )
  ],
);
