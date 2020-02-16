import 'package:flutter/material.dart';

import 'api/get_service.dart';
import 'app/app.dart';

void main() {
  final service = GetService();
  runApp(SocialApp(service: service));
}
