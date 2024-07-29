import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/book_an_intervention_button.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/tabs/tab2-activation/widgets/title.dart';

import '../../../../general_widgets/divide.dart';
import 'widgets/operating_time.dart';

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
            const Title2(),
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


