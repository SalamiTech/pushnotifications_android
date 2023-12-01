import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotifications_android/main.dart';

class FirebaseApi {
  // instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // A function to initialize notification
  Future<void> initNotification() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token
    print('Token: $fCMToken');

    // initialize further settings for push noti
  }

  // A function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if message is null, do nothing
    if (message == null) return;

    // navigate to new screen when message is received and user taps on the notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  // A function to initialize background settings
  Future initPushNotification() async {
    // hanle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listners for when a notifcation opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
