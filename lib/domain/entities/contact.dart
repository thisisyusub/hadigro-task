import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int id;
  final String email;
  final String name;
  final int type;
  final String? country;
  final String avatar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int availability;

  const Contact({
    required this.id,
    required this.email,
    required this.name,
    required this.type,
    this.country,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.availability,
  });

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      type,
      country,
      avatar,
      createdAt,
      updatedAt,
      availability,
    ];
  }
}
