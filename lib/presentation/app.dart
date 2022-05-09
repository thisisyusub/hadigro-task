import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'app_router.dart';
import 'bloc/auth/auth_cubit.dart';

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AuthCubit>()..checkAuth(),
      child: MaterialApp.router(
        title: 'Hadigro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('az'),
      ),
    );
  }
}
