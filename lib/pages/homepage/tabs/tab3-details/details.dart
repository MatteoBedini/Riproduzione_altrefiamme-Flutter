import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/book_an_intervention_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/divide.dart';

import 'widgets/details_table.dart';
import 'widgets/title.dart';

class Details extends StatelessWidget {

  final TabController tabController;
  const Details({super.key, required this.tabController});

  void _navigateToTab2() {
    tabController.animateTo(1); // Naviga al secondo elemento (Index 1: Accensione)
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Title3(),
          const DetailsTable(),
          _operatingTimeButtonRedirect(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('il tuo manutentore', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const Divide(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome Cognome', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('Telefono:', style: TextStyle(fontSize: 16, ),),
                    Text('333 3333333'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.green.shade800),
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        child: const Row(
                            children: [
                              Icon(FontAwesomeIcons.phone),
                              SizedBox(width: 5),
                              Text('Chiama')
                            ],
                        )
                    ),
                  ],
                )
              ]
            ),
          ),
      
          const BookInterventionButton()
        ],
      ),
    );
  }

  Padding _operatingTimeButtonRedirect() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(60,20,60,20),
        child: TextButton(
            onPressed: _navigateToTab2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Tutti i tempi di accensione',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            )),
      );
  }
}


