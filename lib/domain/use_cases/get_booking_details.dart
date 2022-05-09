import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../../core/use_case/use_case.dart';
import '../entities/booking.dart';
import '../entities/generic_response.dart';
import '../repositories/booking_repository.dart';

class GetBookingDetails
    extends UseCase<dynamic, GenericResponse<Booking>, String> {
  GetBookingDetails(this.bookingRepository);

  final BookingRepository bookingRepository;

  @override
  FutureOr<Either<Failure, GenericResponse<Booking>>> call(String params) {
    return bookingRepository.fetchBookingDetails(params);
  }
}
