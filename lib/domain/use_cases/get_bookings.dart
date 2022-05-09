import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../../core/use_case/use_case.dart';
import '../entities/booking.dart';
import '../entities/generic_response.dart';
import '../repositories/booking_repository.dart';

class GetBookings
    extends UseCase<dynamic, GenericResponse<List<Booking>>, Unit> {
  GetBookings(this.bookingRepository);

  final BookingRepository bookingRepository;

  @override
  FutureOr<Either<Failure, GenericResponse<List<Booking>>>> call(Unit params) {
    return bookingRepository.fetchBookings();
  }
}
