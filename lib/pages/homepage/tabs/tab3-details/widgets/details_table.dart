import  'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/general_widgets/divide.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Codice ID',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  '12341435134561trtqwtqt',
                  style: TextStyle(fontSize: 14),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Tipologia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  'Pellet',
                  style: TextStyle(fontSize: 15),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Marca',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 15),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Pressione',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  '12 Pa',
                  style: TextStyle(fontSize: 15),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Temperatura',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  '194 C',
                  style: TextStyle(fontSize: 15),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divide(),
        ],
      ),
    );
  }
}