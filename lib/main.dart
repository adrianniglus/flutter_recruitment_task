import 'package:flutter/material.dart';
import 'data/handlers/environment_handler.dart';
import 'injectable/injectable.dart';
import 'movie_app.dart';

Future<void> main() async {
  // Ensure the widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the environment handler
  await EnvironmentHandler.init();
  // Initialize the dependencies
  configureDependencies();

  runApp(MovieApp());
}
