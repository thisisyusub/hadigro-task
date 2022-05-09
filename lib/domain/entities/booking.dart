import 'package:equatable/equatable.dart';

import 'contact.dart';

class Booking extends Equatable {
  final int id;
  final String code;
  final int userId;
  final DateTime createdAt;
  final int status;
  final String totalPrice;
  final String payablePrice;
  final int used;
  final bool isNew;
  final bool isFirstBooking;
  final Contact contact;

  const Booking({
    required this.id,
    required this.code,
    required this.userId,
    required this.createdAt,
    required this.status,
    required this.totalPrice,
    required this.payablePrice,
    required this.used,
    required this.isNew,
    required this.isFirstBooking,
    required this.contact,
  });

  @override
  List<Object?> get props {
    return [
      id,
      code,
      userId,
      createdAt,
      status,
      totalPrice,
      payablePrice,
      used,
      isNew,
      isFirstBooking,
      contact,
    ];
  }
}
