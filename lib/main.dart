import 'package:bookly_app/app.dart';
import 'package:bookly_app/core/services/services_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setUpServicesLocator();
  runApp(const BooklyApp());
}
