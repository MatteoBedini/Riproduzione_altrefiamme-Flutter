import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Activation extends StatelessWidget {
  const Activation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Title(),
          Divider(
            color: Colors.grey.shade400,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          const Date()
        ],
      ),
    );
  }
}

class Date extends StatefulWidget {
  const Date({
    super.key,
  });

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  int week_day_1 = 17;
  int week_day_2 = 24;

  List months = [
    'Gennaio',
    'Febbraio',
    'Marzo',
    'Aprile',
    'Maggio',
    'Giugno',
    'Luglio',
    'Agosto',
    'Settembre',
    'Ottobre',
    'Novembre',
    'Dicembre'
  ];

  String month = 'Luglio';

  int year = 2024;

  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: IntrinsicHeight(
            child: _dates(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _oggiButton(),
            _periodButtons(),
          ],
        )
      ],
    );
  }

  Row _dates() {
    return Row(
      /* mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,*/
      children: [
        Flexible(
            child: Text(
          '$week_day_1 $month $year',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          maxLines: null,
          softWrap: true,
        )),
        VerticalDivider(
          color: Colors.grey.shade600,
          width: 25,
          thickness: 1,
        ),
        Flexible(
            child: Text(
          '$week_day_2 $month $year',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          maxLines: null,
          softWrap: true,
        )),
        _arrows(),
      ],
    );
  }

  Expanded _periodButtons() {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.shade900.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            children: [
              _periodButtonSingle('Settimana', 0),
              Container(
                width: 1,
                height: 50, // Altezza della linea verticale
                color: Colors.grey.shade900.withOpacity(0.5),
              ),
              _periodButtonSingle('Mese', 1),
              Container(
                width: 1,
                height: 50, // Altezza della linea verticale
                color: Colors.grey.shade900.withOpacity(0.5),
              ),
              _periodButtonSingle('Anno', 2),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _periodButtonSingle(String text, int index) {
    return TextButton(
        onPressed: () {
          setState(() {
            _selectedButton = index;
          });

        },
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          backgroundColor: _selectedButton == index
              ? Colors.grey.shade900
              : Colors.transparent,
          foregroundColor:
              _selectedButton == index ? Colors.white : Colors.black,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
          ),
        ));
  }

  Container _oggiButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade900.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              month = 'Luglio';
              year = 2024;
              week_day_1 = 17;
              week_day_2 = 24;
            });

          },
          child: Text(
            'Oggi',
            style: TextStyle(fontSize: 25, color: Colors.grey.shade800),
          )),
    );
  }

  Row _arrows() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey.shade600.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                week_day_1 -= 7;
                week_day_2 -= 7;
              });
            },
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey.shade600.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                week_day_1 += 7;
                week_day_2 += 7;
              });
            },
            child: const Icon(
              FontAwesomeIcons.arrowRight,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
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
                style: TextStyle(fontSize: 50),
                softWrap: true,
              )),
        ),
      ],
    );
  }
}
