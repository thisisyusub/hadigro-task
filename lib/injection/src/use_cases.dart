import 'package:get_it/get_it.dart';

import '../../domain/use_cases/get_booking_details.dart';
import '../../domain/use_cases/get_bookings.dart';
import '../../domain/use_cases/login.dart';
import '../../domain/use_cases/use_booking.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerLazySingleton(() => GetBookings(getIt()));
  getIt.registerLazySingleton(() => GetBookingDetails(getIt()));
  getIt.registerLazySingleton(() => UseBooking(getIt()));
}
