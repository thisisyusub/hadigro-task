import 'package:get_it/get_it.dart';

import '../../core/bloc/app_bloc_observer.dart';
import '../../presentation/bloc/auth/auth_cubit.dart';
import '../../presentation/bloc/booking_details/booking_details_cubit.dart';
import '../../presentation/bloc/bookings/bookings_cubit.dart';
import '../../presentation/bloc/login/login_cubit.dart';
import '../../presentation/bloc/use_booking/use_booking_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => AppBlocObserver());
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerFactory(() => BookingsCubit(getIt()));

  getIt.registerFactoryParam<BookingDetailsCubit, String, dynamic>(
    (param1, _) => BookingDetailsCubit(
      getBookingDetails: getIt(),
      bookingCode: param1,
    ),
  );

  getIt.registerFactoryParam<UseBookingCubit, String, dynamic>(
    (param1, _) => UseBookingCubit(
      useBooking: getIt(),
      bookingCode: param1,
    ),
  );
}
