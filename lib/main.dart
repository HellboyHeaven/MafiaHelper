import 'package:flutter/material.dart';
import 'features/presentation/pages/home.dart';
import 'injection_container.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }

}




