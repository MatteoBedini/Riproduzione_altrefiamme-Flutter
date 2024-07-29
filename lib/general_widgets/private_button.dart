
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/private_page/private_page.dart';




class PrivateButton extends StatelessWidget {
  const PrivateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 15, 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red.shade200,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      child: IconButton(
        icon: const Icon(FontAwesomeIcons.user),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrivatePage()),
          );
        },
      ),
    );
  }
}