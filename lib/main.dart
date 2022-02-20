import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/firebase_options.dart';
import 'package:surf_practice_chat_flutter/screens/chat.dart';

void main() async {
  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyD5bCOfO29kCv2mIdmYa6CEKhud4Gs1YIU',
      iosKey: 'AIzaSyAjvNoe31ZMSakjKFOkhbrZBsj3RyW6plo',
      webKey: 'enter web key here',
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final chatRepository = ChatRepositoryFirebase(FirebaseFirestore.instance);


    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ChatScreen(
              chatRepository: ChatRepositoryFirebase(FirebaseFirestore.instance),
            );
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            "Initialization",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
