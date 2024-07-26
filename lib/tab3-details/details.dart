import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/book_an_intervention_button.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Dettagli'),
        BookInterventionButton()
      ],
    );
  }
}