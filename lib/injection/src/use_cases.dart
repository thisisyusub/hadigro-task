import 'package:get_it/get_it.dart';

import '../../domain/use_cases/get_booking_details.dart';
import '../../domain/use_cases/get_bookings.dart';
import '../../domain/use_cases/login.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerLazySingleton(() => GetBookings(getIt()));
  getIt.registerLazySingleton(() => GetBookingDetails(getIt()));
}
