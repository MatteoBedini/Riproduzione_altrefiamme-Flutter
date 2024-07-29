import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Activation_check extends StatelessWidget {
  const Activation_check({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade400.withOpacity(0.5),
          width: 1,
        ),

      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.solidCircle, color: Colors.red, size: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Il tuo impianto è spento',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),

                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade400.withOpacity(0.6), // Colore della linea
            height: 20, // Altezza della linea
            thickness: 1, // Spessore della linea
            indent: 20, // Indentazione della linea a sinistra
            endIndent: 20, // Indentazione della linea a destra
          ),
          Container(

            padding: const EdgeInsets.fromLTRB(10,0,20,0),
            child: const Text('Ultimo aggiornamento: 01 Luglio 2024 09:37', style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
          ),
        ],
      ),
    );
  }
}