import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/router/router_cubit.dart';
import 'pages/auth/auth_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final _pages = <MaterialPage>[
    const MaterialPage(child: AuthPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouterCubit, RouteState>(
      listener: (context, state) {
        if (state.routingType == RoutingType.pushReplacement) {
          _pages.clear();
        }

        setState(() {
          _pages.add(MaterialPage(child: state.page!));
        });
      },
      child: Navigator(
        pages: [..._pages],
        onPopPage: (route, result) {
          final canPop = route.didPop(result);

          if (canPop) {
            setState(() {
              _pages.removeLast();
            });
          }

          return canPop;
        },
      ),
    );
  }
}
