
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../general_widgets/divide.dart';

class OperatingTime extends StatelessWidget {
  const OperatingTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            border: Border.all(
              color: Colors.green.shade200,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            )
        ),
        child:const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.black,
                    size: 25,
                  ),
                  Expanded(
                    child: Text(
                      'Tempo di funzionamento',
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                ],
              ),
              Divide(),
              Text('0 ore e 0 minuti')
            ],
          ),
        )
    );
  }
}