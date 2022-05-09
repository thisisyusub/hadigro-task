import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/theme/app_colors.dart';
import '../../bloc/bookings/bookings_cubit.dart';
import '../../widgets/gap.dart';
import '../../widgets/loading_view.dart';
import 'widgets/booking_item.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final bookingsState = context.watch<BookingsCubit>().state;

    late final Widget child;

    if (bookingsState.isInProgress) {
      child = const LoadingView();
    } else if (bookingsState.isFailure) {
      child = Text(localizations.errorOccured);
    } else if (bookingsState.isSuccess) {
      final bookings = bookingsState.data!;

      child = ListView.builder(
        itemBuilder: (context, index) {
          return BookingItem(booking: bookings[index]);
        },
        itemCount: bookings.length,
      );
    } else {
      child = const Gap();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.bookings),
        backgroundColor: AppColors.primary,
      ),
      body: child,
    );
  }
}
