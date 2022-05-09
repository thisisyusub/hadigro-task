import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../bloc/booking_details/booking_details_cubit.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final detailsState = context.watch<BookingDetailsCubit>().state;

    late final Widget child;

    if (detailsState.isInProgress) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (detailsState.isFailure) {
      child = Text(localizations.errorOccured);
    } else if (detailsState.isSuccess) {
      final booking = detailsState.data!;

      const style = TextStyle(fontSize: 16);

      child = SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${localizations.code}: ${booking.code}',
                  style: style,
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.price}: ${booking.totalPrice}',
                  style: style,
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.createdAt}: ${DateFormat.yMMMMd().format(
                    (booking.createdAt),
                  )}',
                  style: style,
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.status}: ${booking.status}',
                  style: style,
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.used}: ${booking.used}',
                  style: style,
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.userId}: ${booking.userId}',
                  style: style,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      child = const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.details),
        backgroundColor: AppColors.primary,
      ),
      body: child,
    );
  }
}
