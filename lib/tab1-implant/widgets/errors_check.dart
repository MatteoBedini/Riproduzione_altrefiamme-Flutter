import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Errors_check extends StatelessWidget {
  const Errors_check({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Stack(
        clipBehavior: Clip.none,

        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.green.shade200,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                'Il tuo impianto funziona come previsto',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          Positioned(
            top: -15,
            left: 30,
            child: Container(

              padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(25),


              ),
              child: const Icon(
                FontAwesomeIcons.faceSmile,
                color: Colors.green,
                size: 35,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
