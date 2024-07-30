import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/pages/login-page/login.dart';

import '../../general_widgets/divide.dart';
import '../profile_page/profile_page.dart';

class PrivatePage extends StatelessWidget {
  const PrivatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          'Account',
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile
                    const ProfilePrivacyButtons(),

                    // Assistenza
                    const Assistance(),

                    //Gestione notifiche
                    const Notifies(),

                    //Logout
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: const Text(
                            'Log out',
                            style: TextStyle(color: Colors.red, fontSize: 25),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '1.0.0 version',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notifies extends StatefulWidget {
  const Notifies({
    super.key,
  });

  @override
  State<Notifies> createState() => _NotifiesState();
}

class _NotifiesState extends State<Notifies> {
  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: const Text(
            'Gestione notifiche',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
            onPressed: _toggleCheckbox,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Ricevi le notifiche',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Switch(
                    value: _isChecked,
                    onChanged: _handleCheckboxChange,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.grey.shade300,
                    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.green;
                      }
                      return Colors.grey.shade400;
                    }),
                    thumbColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors
                            .white; // Colore della pallina quando è attivo
                      }
                      return Colors
                          .grey; // Colore della pallina quando è inattivo
                    })),
              ],
            )),
        const Divide(),
      ],
    );
  }
}

class Assistance extends StatelessWidget {
  const Assistance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: const Text(
            'Assistenza',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const Divide(),

        // FAQ
        TextButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'FAQ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        const Divide(),

        // Assistenza su questa app
        TextButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Assistenza su questa app',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        const Divide(),
      ],
    );
  }
}

class ProfilePrivacyButtons extends StatelessWidget {
  const ProfilePrivacyButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'il mio profilo',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        const Divide(),

        // Privacy
        TextButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Privacy',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            )),
        const Divide(),
      ],
    );
  }
}

