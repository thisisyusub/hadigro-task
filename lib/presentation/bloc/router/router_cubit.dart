import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_state.dart';

export 'router_state.dart';

class RouterCubit extends Cubit<RouteState> {
  RouterCubit() : super(const RouteState());

  void push(Widget page) async {
    await Future.delayed(Duration.zero);

    emit(
      RouteState(
        routingType: RoutingType.push,
        page: page,
      ),
    );
  }

  void pushReplacement(Widget page) async {
    emit(
      RouteState(
        routingType: RoutingType.pushReplacement,
        page: page,
      ),
    );
  }
}
