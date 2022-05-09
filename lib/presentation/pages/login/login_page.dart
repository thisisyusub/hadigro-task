import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: localizations.email,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: localizations.password,
                  ),
                ),
                const SizedBox(height: 32),
                CupertinoButton(
                  color: Colors.blue,
                  child: Text(
                    localizations.login,
                  ),
                  onPressed: () {
                    context.read<LoginCubit>().login(
                          _email.text,
                          _password.text,
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
