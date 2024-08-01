import 'package:flutter/material.dart';
import '../../../../general_widgets/book_an_intervention_button.dart';
import 'widgets/name_detail_section.dart';
import 'widgets/errors_check.dart';
import 'widgets/activation_check.dart';
import 'widgets/total_ignition_time.dart';
import 'package:http/http.dart' as http;

class Implant extends StatefulWidget {
  final TabController tabController;
  const Implant({super.key, required this.tabController});

  @override
  State<Implant> createState() => _ImplantState();
}

class _ImplantState extends State<Implant> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _setAttributes(); // Fetch the username when the widget is initialized
  }

  Future<String> _fetchAttributes() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8701/user/name'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Failed to load name';
    }
  }

  Future<void> _setAttributes() async {
    final userName = await _fetchAttributes();
    setState(() {
      username = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ciao $username',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text('Il tuo impianto'),
            Name_detail_section(
              tabController: widget.tabController,
            ),
            const Errors_check(),
            const Activation_check(),
            TotalIgnitionTime(
              tabController: widget.tabController,
            ),
            const BookInterventionButton(),
          ],
        ),
      ),
    );
  }
}
