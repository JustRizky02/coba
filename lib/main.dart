
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Page/FirstScreen.dart';
import 'Provider_/User_Provider.dart';
import 'Provider_/Provider.dart';
import 'Provider_/user_firstpage_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserFirstPageProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstScreen(), // Menambahkan 'const' di sini
    );
  }
}
