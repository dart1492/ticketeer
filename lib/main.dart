import 'package:flutter/material.dart';
import 'package:ticketeer/app.dart';
import 'package:ticketeer/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}
