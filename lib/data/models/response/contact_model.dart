import '../../../domain/entities/contact.dart';

class ContactModel extends Contact {
  const ContactModel({
    required int id,
    required String email,
    required String name,
    required int type,
    required String avatar,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int availability,
    String? country,
  }) : super(
          id: id,
          email: email,
          name: name,
          type: type,
          avatar: avatar,
          createdAt: createdAt,
          updatedAt: updatedAt,
          availability: availability,
          country: country,
        );

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      type: json['type'],
      country: json['country'],
      availability: json['availability'],
      avatar: json['avatar'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
