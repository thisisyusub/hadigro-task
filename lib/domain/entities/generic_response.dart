import 'package:equatable/equatable.dart';

class GenericResponse<T> extends Equatable {
  final bool success;
  final T? data;
  final String message;

  const GenericResponse({
    required this.success,
    this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];
}
