import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handlebackgroundMessage(RemoteMessage message) async {
    print('Handling a background message: ${message.messageId}');
    print('Title : ${message.notification!.title}');
    print('Body : ${message.notification!.body}');
    print('payload : ${message.data}');
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
  }
}
