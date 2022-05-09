import '../../../domain/entities/generic_response.dart';

extension IterableConverterExt on List<dynamic> {
  List<T> toIterable<T>(T Function(Map<String, dynamic>) iterableItemFromJson) {
    final items = <T>[];

    for (int i = 0; i < length; i++) {
      items.add(iterableItemFromJson(this[i]));
    }

    return items;
  }
}

class GenericResponseModel<T> extends GenericResponse<T> {
  const GenericResponseModel({
    required bool success,
    required T? data,
    required String message,
  }) : super(
          success: success,
          data: data,
          message: message,
        );

  factory GenericResponseModel.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? dataFromJson,
  }) {
    return GenericResponseModel(
      success: json['success'],
      data: dataFromJson?.call(json['data']),
      message: json['message'],
    );
  }

  factory GenericResponseModel.fromIterableJson(
    Map<String, dynamic> json, {
    T Function(List<dynamic>)? dataFromJson,
  }) {
    return GenericResponseModel(
      success: json['success'],
      message: json['message'],
      data: dataFromJson != null ? dataFromJson(json['data']) : null,
    );
  }
}
