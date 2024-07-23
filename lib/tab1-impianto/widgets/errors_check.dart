import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Errors_check extends StatelessWidget {
  const Errors_check({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Stack(
        clipBehavior: Clip.none,

        children: [

          Container(
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
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Text(
              'Il tuo impianto funziona come previsto',
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),

          ),
          Positioned(
            top: -15,
            left: 30,
            child: Container(

              padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
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
