import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riproduzione_app_altrefiamme/tab1-implant/widgets/heightNotifier.dart';

import 'package:riproduzione_app_altrefiamme/tab3-details/details.dart';


import 'tab1-implant/implant.dart';
import 'tab2-activation/activation.dart';
import 'bottombar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HeightNotifier(),
      child: const MyApp(),
    )

  );
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
        ) ,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Riproduzione altrefiamme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/logo.png', width: 160,color: Colors.white,),

      ),
      body: Container(

        decoration:
        const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: TabBarView(

          controller: _tabController,
          children: [
            Implant(tabController: _tabController),
            const Activation(),
            const Details(),

          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: BottomBar(tabController: _tabController)),
    );
  }
}

