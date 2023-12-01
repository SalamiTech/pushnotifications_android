import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications_android/api/firebase_api.dart';
import 'package:pushnotifications_android/firebase_options.dart';
import 'package:pushnotifications_android/pages/homepage.dart';
import 'package:pushnotifications_android/pages/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        navigatorKey: navigatorKey,
        routes: {
          '/notification_screen': (context) => const NotificationPage(),
        });
  }
}
