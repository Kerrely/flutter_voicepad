import 'package:flutter/material.dart';
import 'package:voice_pad/app.dart';
import 'package:voice_pad/utils/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeInjector();

  runApp(const VoicePadApp());
}
