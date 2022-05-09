import 'package:get_it/get_it.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/booking_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: getIt(),
      preferencesLocalDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(getIt()),
  );
}
