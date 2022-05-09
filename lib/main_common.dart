import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/bloc/app_bloc_observer.dart';
import 'injection/injection_container.dart' as di;
import 'presentation/app.dart';

void mainCommon(di.Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await di.init(environment);

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: GetIt.instance.get<AppBlocObserver>(),
  );
}
