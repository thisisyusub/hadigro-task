import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Endpoints {
  static final prodBaseUrl = dotenv.env["PROD_BASE_URL"]!;
  static final devBaseUrl = dotenv.env["DEV_BASE_URL"]!;

  static const excludeEndpoints = [
    login,
  ];

  static const login = '/login';
  static const bookings = '/bookings';
}

abstract class Queries {}
