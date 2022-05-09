import 'package:dio/dio.dart';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/generic_response.dart';
import '../../domain/repositories/booking_repository.dart';
import '../data_sources/remote/booking_remote_data_source.dart';
import '../models/response/generic_response_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this.bookingRemoteDataSource);

  final BookingRemoteDataSource bookingRemoteDataSource;

  @override
  Future<Either<Failure, GenericResponse<List<Booking>>>>
      fetchBookings() async {
    try {
      return Success(await bookingRemoteDataSource.fetchBookings());
    } on DioError catch (e) {
      if (e.response?.data != null) {
        final response = GenericResponseModel.fromJson(e.response!.data);
        return Error(Failure.network(response.message));
      } else {
        return const Error(Failure.network());
      }
    } catch (_) {
      return const Error(Failure.other());
    }
  }

  @override
  Future<Either<Failure, GenericResponse<Booking>>> fetchBookingDetails(
      String code) async {
    try {
      return Success(
        await bookingRemoteDataSource.fetchBookingDetails(code),
      );
    } on DioError catch (e) {
      if (e.response?.data != null) {
        final response = GenericResponseModel.fromJson(e.response!.data);
        return Error(Failure.network(response.message));
      } else {
        return const Error(Failure.network());
      }
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
