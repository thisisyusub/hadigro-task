import '../../../domain/entities/booking.dart';
import '../../../domain/entities/contact.dart';
import 'contact_model.dart';

class BookingModel extends Booking {
  const BookingModel({
    required int id,
    required String code,
    required int userId,
    required DateTime createdAt,
    required int status,
    required String totalPrice,
    required String payablePrice,
    required int used,
    required bool isNew,
    required bool isFirstBooking,
    required Contact contact,
  }) : super(
          id: id,
          code: code,
          userId: userId,
          createdAt: createdAt,
          status: status,
          totalPrice: totalPrice,
          payablePrice: payablePrice,
          used: used,
          isNew: isNew,
          isFirstBooking: isFirstBooking,
          contact: contact,
        );

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      code: json['code'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'],
      totalPrice: json['total_price'],
      payablePrice: json['payable_price'],
      used: json['used'],
      isNew: json['isNew'],
      isFirstBooking: json['isFirstBooking'],
      contact: ContactModel.fromJson(json['contact']),
    );
  }
}
