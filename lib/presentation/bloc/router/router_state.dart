import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum RoutingType { initial, push, pushReplacement }

class RouteState extends Equatable {
  final RoutingType routingType;
  final Widget? page;

  const RouteState({
    this.routingType = RoutingType.initial,
    this.page,
  });

  @override
  List<Object?> get props => [routingType, page];
}
