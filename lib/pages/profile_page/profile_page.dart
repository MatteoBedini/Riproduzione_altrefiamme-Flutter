import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../general_widgets/divide.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  _buildContent(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize:18),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divide(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text(
            'Profilo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    _buildContent('Nome', 'Maria'),
                    _buildContent('Cognome', 'Rossi'),
                    _buildContent('Indirizzo', 'Via del pozzo 12, 00100 Roma'),
                    _buildContent('indirizzo mail', 'w4h2E@example.com'),
                    const TextButton(
                        onPressed: null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Modifica indirizzo',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.arrowRight,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
