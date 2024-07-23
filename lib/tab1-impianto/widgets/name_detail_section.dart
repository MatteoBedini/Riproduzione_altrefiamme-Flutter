import 'package:flutter/material.dart';


class Name_detail_section extends StatelessWidget {
  final TabController tabController;
  const Name_detail_section({super.key, required this.tabController});

  void _navigateToDetails() {
    tabController.animateTo(2); // Naviga al secondo elemento (Index 1: Accensione)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'Stufa pellet soggiorno',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              maxLines: null,
              softWrap: true,
            ),
          ),
          Flexible(
            child: ElevatedButton(
                onPressed: _navigateToDetails,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'DETTAGLI',
                  style: TextStyle(fontSize: 25),
                )),
          )
        ],
      ),
    );
  }
}