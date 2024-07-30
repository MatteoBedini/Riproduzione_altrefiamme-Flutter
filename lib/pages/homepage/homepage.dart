
import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/tabs/tab1-implant/implant.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/tabs/tab2-activation/activation.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/tabs/tab3-details/details.dart';
import '../../general_widgets/bottom_bar.dart';
import '../../general_widgets/private_button.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Image.asset(
          'assets/images/logo.png',
          width: 150,
          color: Colors.white,
        ),
        actions: const [PrivateButton()],
      ),
      body: Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            Implant(tabController: _tabController,key: const PageStorageKey(1),),
            const Activation(key: PageStorageKey(2),),
            Details(tabController: _tabController,key: const PageStorageKey(3),),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white, child: BottomBar(tabController: _tabController)),
    );
  }
}