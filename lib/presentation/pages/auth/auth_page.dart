import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_router.dart';
import '../../bloc/auth/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state == AuthState.authenticated) {
          appRouter.go(AppRoutes.bookings);
        } else if (state == AuthState.unauthenticated) {
          appRouter.go(AppRoutes.login);
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
