import 'package:flutter/material.dart';
import '../../../../general_widgets/book_an_intervention_button.dart';
import 'widgets/name_detail_section.dart';
import 'widgets/errors_check.dart';
import 'widgets/activation_check.dart';
import 'widgets/total_ignition_time.dart';



class Implant extends StatelessWidget {
  final TabController tabController;
  const Implant({super.key, required this.tabController});



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Container(

        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Ciao utente',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text('Il tuo impianto'),
            Name_detail_section(tabController: tabController,),
            const Errors_check(),
            const Activation_check(),
            TotalIgnitionTime(tabController: tabController,),

            const BookInterventionButton(),
          ],
        ),
      ),
    );
  }
}



