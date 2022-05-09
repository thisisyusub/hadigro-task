import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/entities/booking.dart';
import '../../../domain/use_cases/get_bookings.dart';

typedef BookingsState = DataState<List<Booking>, Unit>;

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit(this.getBookings) : super(const DataState());

  final GetBookings getBookings;

  void fetchBookings() async {
    emit(state.copyWith(isInProgress: true));

    final result = await getBookings(unit);

    result.when(
      error: (_) => emit(state.copyWith(isFailure: true)),
      success: (result) {
        emit(state.copyWith(isSuccess: true, data: result.data));
      },
    );
  }
}
