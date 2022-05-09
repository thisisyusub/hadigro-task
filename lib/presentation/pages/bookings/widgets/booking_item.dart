import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/booking.dart';
import '../../../app_router.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({
    Key? key,
    required this.booking,
  }) : super(key: key);

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(16.0),
        controlAffinity: ListTileControlAffinity.platform,
        title: Row(
          children: [
            Material(
              color: const Color.fromRGBO(11, 97, 193, 1),
              borderRadius: BorderRadius.circular(16.0),
              child: InkWell(
                onTap: () {
                  appRouter.push(
                    context.namedLocation(
                      AppRoutes.bookingDetails,
                      queryParams: {
                        'bookingCode': booking.code,
                      },
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    booking.code.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              '${booking.totalPrice} ${AppLocalizations.of(context).azn}',
            ),
          ],
        ),
        children: [
          Text(booking.contact.email),
          Text(booking.contact.name),
          Text(
            DateFormat.yMMMMd().format(
              (booking.createdAt),
            ),
          ),
        ],
      ),
    );
  }
}
