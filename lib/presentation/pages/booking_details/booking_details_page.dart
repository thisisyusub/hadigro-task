import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../bloc/booking_details/booking_details_cubit.dart';
import '../../bloc/use_booking/use_booking_cubit.dart';
import '../../widgets/loading_view.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({
    Key? key,
    this.showSetToUseButton = false,
  }) : super(key: key);

  final bool showSetToUseButton;

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
        child: Column(
          children: [
            Card(
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
            if (showSetToUseButton)
              BlocConsumer<UseBookingCubit, UseBookingState>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();

                  if (state.isFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        content: Text(localizations.errorOccured),
                      ),
                    );
                  } else if (state.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          localizations.successfullyCompleted,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isInProgress) {
                    return const LoadingView();
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        ),
                        primary: AppColors.primary,
                      ),
                      onPressed: () {
                        context.read<UseBookingCubit>().changeStatusToUsed();
                      },
                      child: Text(localizations.markAsUsed),
                    ),
                  );
                },
              ),
          ],
        ),
      );
    } else {
      child = const SizedBox.shrink();
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.details),
          backgroundColor: AppColors.primary,
        ),
        body: child,
      ),
    );
  }
}
