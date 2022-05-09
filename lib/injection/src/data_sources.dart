import 'package:get_it/get_it.dart';

import '../../data/data_sources/local/preferences_local_data_source.dart';
import '../../data/data_sources/remote/auth_remote_data_source.dart';
import '../../data/data_sources/remote/booking_remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<PreferencesLocalDataSource>(
    () => PreferencesLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(getIt()),
  );
}
