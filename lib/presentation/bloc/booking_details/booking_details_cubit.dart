import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/data_state.dart';
import '../../../domain/entities/booking.dart';
import '../../../domain/use_cases/get_booking_details.dart';

typedef BookingDetailsState = DataState<Booking, String?>;

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit({
    required this.getBookingDetails,
    required this.bookingCode,
  }) : super(const DataState());

  final GetBookingDetails getBookingDetails;
  final String bookingCode;

  void fetchBookingDetails() async {
    emit(state.copyWith(isInProgress: true));

    final result = await getBookingDetails(bookingCode);

    result.when(
      error: (_) => emit(state.copyWith(isFailure: true)),
      success: (result) {
        emit(state.copyWith(isSuccess: true, data: result.data));
      },
    );
  }
}
