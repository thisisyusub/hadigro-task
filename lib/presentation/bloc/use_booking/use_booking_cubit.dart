import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/data_state.dart';
import '../../../core/either.dart';
import '../../../domain/use_cases/use_booking.dart';

typedef UseBookingState = DataState<Unit, Unit>;

class UseBookingCubit extends Cubit<UseBookingState> {
  UseBookingCubit({
    required this.useBooking,
    required this.bookingCode,
  }) : super(const DataState());

  final UseBooking useBooking;
  final String bookingCode;

  void changeStatusToUsed() async {
    emit(state.copyWith(isInProgress: true));

    final result = await useBooking(bookingCode);

    result.when(
      error: (_) => state.copyWith(isFailure: true),
      success: (_) => state.copyWith(isSuccess: true),
    );
  }
}
