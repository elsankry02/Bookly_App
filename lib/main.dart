import 'package:flutter/material.dart';

import 'app.dart';
import 'Features/data/services/services_locator.dart';

void main() {
  setUpServicesLocator();
  runApp(const BooklyApp());
}
