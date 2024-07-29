import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  String month = 'Lug';

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
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          height: 45,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              _todayButton(),

              _periodButtons(),
            ],
          ),
        )
      ],
    );
  }

  Row _dates() {
    return Row(
      children: [
        Date1(week_day_1: week_day_1, month: month, year: year),
        VerticalDivider(
          color: Colors.grey.shade600,
          width: 25,
          thickness: 1,
        ),
        Date2(week_day_2: week_day_2, month: month, year: year),
        _arrows(),
      ],
    );
  }

  Expanded _periodButtons() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
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
                height: 48, // Altezza della linea verticale
                color: Colors.grey.shade900.withOpacity(0.5),
              ),
              _periodButtonSingle('Mese', 1),
              Container(
                width: 1,
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
        minimumSize: const Size(130, 0),
        shape: index == 0
            ? const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14)))
            : index == 1
            ? const RoundedRectangleBorder()
            : const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14))),
        backgroundColor: _selectedButton == index
            ? Colors.grey.shade900
            : Colors.transparent,
        foregroundColor:
        _selectedButton == index ? Colors.white : Colors.black,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  SizedBox _todayButton() {
    return SizedBox(
      height: 45,
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
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
            style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
          ),
        ),
      ),
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

class Date2 extends StatelessWidget {
  const Date2({
    super.key,
    required this.week_day_2,
    required this.month,
    required this.year,
  });

  final int week_day_2;
  final String month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        '$week_day_2 $month $year',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLines: null,
        softWrap: true,
      ),
    );
  }
}

class Date1 extends StatelessWidget {
  const Date1({
    super.key,
    required this.week_day_1,
    required this.month,
    required this.year,
  });

  final int week_day_1;
  final String month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        '$week_day_1 $month $year',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLines: null,
        softWrap: true,
      ),
    );
  }
}
