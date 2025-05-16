import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/services_locator.dart';

void main() {
  setUpServicesLocator();
  runApp(const BooklyApp());
}
