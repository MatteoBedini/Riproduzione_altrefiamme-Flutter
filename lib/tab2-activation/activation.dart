import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/book_an_intervention_button.dart';
import 'package:riproduzione_app_altrefiamme/tab2-activation/widgets/operating_time.dart';
import '../general_widgets/divide.dart';
import 'widgets/date.dart';
import 'widgets/chart.dart';

class Activation extends StatelessWidget {
  const Activation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Title(),
            const Divide(),
            const Date(),
            const OperatingTime(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 300,
              child: const MyChart(points: [1,2,4,3,5,16,7,8,8,3,0,0],),
            ),

            const BookInterventionButton(),
          ],
        ),
      ),
    );
  }
}



class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.chartLine,
          color: Colors.black,
          size: 50,
        ),
        Flexible(
          child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: const Text(
                'Totale tempo di accensione',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                softWrap: true,
              )),
        ),
      ],
    );
  }
}
