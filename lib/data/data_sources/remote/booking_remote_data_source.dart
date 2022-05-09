import 'package:dio/dio.dart';

import '../../../core/constants/endpoints.dart';
import '../../models/response/booking_model.dart';
import '../../models/response/generic_response_model.dart';

abstract class BookingRemoteDataSource {
  Future<GenericResponseModel<List<BookingModel>>> fetchBookings();

  Future<GenericResponseModel<BookingModel>> fetchBookingDetails(String code);

  Future<GenericResponseModel<BookingModel>> useBooking(String code);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  const BookingRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<GenericResponseModel<List<BookingModel>>> fetchBookings() async {
    final response = await dio.get(Endpoints.bookings);

    return GenericResponseModel.fromIterableJson(
      response.data,
      dataFromJson: (json) => json.toIterable(BookingModel.fromJson),
    );
  }

  @override
  Future<GenericResponseModel<BookingModel>> fetchBookingDetails(
    String code,
  ) async {
    final response = await dio.get(
      Endpoints.bookingDetails(code),
    );

    return GenericResponseModel.fromJson(
      response.data,
      dataFromJson: BookingModel.fromJson,
    );
  }

  @override
  Future<GenericResponseModel<BookingModel>> useBooking(String code) async {
    final response = await dio.get(Endpoints.useBooking(code));

    return GenericResponseModel.fromJson(
      response.data,
      dataFromJson: BookingModel.fromJson,
    );
  }
}
