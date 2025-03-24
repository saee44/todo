import 'package:flutter/material.dart';

//import 'package:todo/dashboard.dart';
//import 'package:todo/loginscreen.dart';
import 'package:todo/splashscreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splashscreen());
  }
}
