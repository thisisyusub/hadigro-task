import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/router/router_cubit.dart';
import '../login/login_page.dart';
import '../main/main_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state == AuthState.authenticated) {
          context.read<RouterCubit>().pushReplacement(const MainPage());
        } else if (state == AuthState.unauthenticated) {
          context.read<RouterCubit>().pushReplacement(
                BlocProvider(
                  create: (_) => GetIt.instance.get<LoginCubit>(),
                  child: const LoginPage(),
                ),
              );
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Checking for auth...',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
