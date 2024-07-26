import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'heightNotifier.dart';



class TotalIgnitionTime extends StatefulWidget {
  final TabController tabController;
  const TotalIgnitionTime({super.key, required this.tabController});

  @override
  State<TotalIgnitionTime> createState() => _TotalIgnitionTimeState();
}

class _TotalIgnitionTimeState extends State<TotalIgnitionTime> {


  final GlobalKey _upperContainerKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeight();
    });
  }

  void _updateHeight() {
    // Controlla se il contesto è nullo o se il RenderBox è nullo
    final renderBox = _upperContainerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final height = renderBox.size.height;
      Provider.of<HeightNotifier>(context, listen: false).setHeight(height);
    }
  }

  void _navigateToActivation() {
    widget.tabController.animateTo(1); // Naviga al secondo elemento (Index 1: Accensione)
  }





  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        // Container sovrapposto per il bottone
        _buildUnderContainer(),

        // Container principale grigio
        UpperContainer(key: _upperContainerKey),



      ],
    );
  }

  Container _buildUnderContainer() {
    return Container(
        height: Provider.of<HeightNotifier>(context).getHeightWithOffset(40),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomCenter,

        decoration: BoxDecoration(
          color: Colors.white, // Colore bianco
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade400.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: _navigateToActivation,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8), // Rimuove il padding verticale
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0), // Cambia qui il valore per il radius desiderato
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tutti i tempi di accensione'),
                Icon(FontAwesomeIcons.arrowRight,size:20),
              ],

            ),
          ), // Testo del bottone
        ),
      );
  }
}

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade400.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.clock,
                color: Colors.black,
                size: 20,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Tempo totale di accensione',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade400.withOpacity(0.6),
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Luglio 2024',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                ),
                Flexible(
                  child: Text(
                    '0 ore e 0 minuti',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
