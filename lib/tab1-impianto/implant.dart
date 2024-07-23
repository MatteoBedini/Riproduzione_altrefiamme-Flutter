import 'package:flutter/material.dart';
import 'widgets/name_detail_section.dart';
import 'widgets/errors_check.dart';
import 'widgets/activation_check.dart';
import 'widgets/activation_time.dart';


class Implant extends StatelessWidget {
  final TabController tabController;
  const Implant({super.key, required this.tabController});



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Ciao utente',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text('Il tuo impianto'),
            Name_detail_section(tabController: tabController,),
            const Errors_check(),
            const Activation_check(),
            Activation_time(tabController: tabController,),

            Container(
              margin: const EdgeInsets.all(30),
              child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'PRENOTA UN INTERVENTO',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

