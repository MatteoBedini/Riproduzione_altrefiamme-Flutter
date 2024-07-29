import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Title3 extends StatelessWidget {
  const Title3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0,0,40,0),
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black,
              size: 50,
            ),
          ),
          const Flexible(
            child: Text(
              'Dettagli impianto',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}