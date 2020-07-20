import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  // Environment.prod is an env string
  // This comes from injection config
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
