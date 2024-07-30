import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/tabs/tab1-implant/widgets/heightNotifier.dart';
import 'package:riproduzione_app_altrefiamme/pages/login-page/login.dart';


import 'pages/homepage/homepage.dart';

import 'general_widgets/bottom_bar.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HeightNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riproduzione altrefiamme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.red,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.grey.shade400),
        ),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}





