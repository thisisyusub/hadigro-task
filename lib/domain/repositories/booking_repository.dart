import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../entities/booking.dart';
import '../entities/generic_response.dart';

abstract class BookingRepository {
  Future<Either<Failure, GenericResponse<List<Booking>>>> fetchBookings();

  Future<Either<Failure, GenericResponse<Booking>>> fetchBookingDetails(
    String code,
  );

  Future<Either<Failure, GenericResponse<Booking>>> useBooking(String code);
}
