import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'notification.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Notification'),
      ),
      body: Center(
        child: Text(
          "Flutter Notification Details",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NotificationService().showPrayerNotification(id: 1, title: '001', body: 'Hello World', duration: Duration(seconds: 1));
        },
        child: Icon(Icons.notifications),
      ),
    );
  }
}