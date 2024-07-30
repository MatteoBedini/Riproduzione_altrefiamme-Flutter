
import 'package:flutter/material.dart';

import '../pages/book_an_intervention/book_and_intervention.dart';
class BookInterventionButton extends StatelessWidget {
  const BookInterventionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ElevatedButton(

                style: ButtonStyle(

                  backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  maximumSize: WidgetStateProperty.all(const Size(double.infinity,double.infinity)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookAnIntervention()),
                  );
                },
                child:  const Text(
                  'PRENOTA UN INTERVENTO',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  softWrap: true,
                )
            ),
          ),
        ],
      ),
    );
  }
}