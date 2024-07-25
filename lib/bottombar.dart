import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,

      tabs: const [
        Tab(icon: Icon(FontAwesomeIcons.fire), child: Text('Impianto', style: TextStyle(fontSize: 10),)),
        Tab(icon: Icon(FontAwesomeIcons.chartLine), child: Text('Accensione', style: TextStyle(fontSize: 10),)),
        Tab(icon: Icon(FontAwesomeIcons.magnifyingGlass), child: Text('Dettagli', style: TextStyle(fontSize: 10),)),
      ],
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicator: const BoxDecoration(
        color:Colors.red,
      ),
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}