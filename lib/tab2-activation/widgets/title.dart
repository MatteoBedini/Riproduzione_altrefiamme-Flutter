import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Title2 extends StatelessWidget {
  const Title2({
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
