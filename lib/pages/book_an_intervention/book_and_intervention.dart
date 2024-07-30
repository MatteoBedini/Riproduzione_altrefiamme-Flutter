import 'package:flutter/material.dart';

import '../../general_widgets/divide.dart';

class BookAnIntervention extends StatelessWidget {
  const BookAnIntervention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Prenota un intervento',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(

                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: const Text(
                  'La tua richiesta verrà inviata a',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100, // Colore bianco
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade400.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'il tuo manutentore',
                        style: TextStyle(fontSize: 20),
                      ),
                      Divide(),
                      Text(
                        'Martini Impianti',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Telefono',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '333 3333333',
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
              ),
              const Text('Scrivi il messaggio', style: TextStyle(fontSize: 20)),
              TextField(
                minLines: 10,
                maxLines: null, // Allow multiple lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const ElevatedButton(onPressed: null, child: Text('INVIA',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
