
import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../login-page/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.red,
            child: const Column(
                children: [
                  Logo(),
                  Title(),
                  Form(),
                  AlreadyRegisteredRedirect()
                ]
            )
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({
    super.key,
  });

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> register(String email, String password, String name, String surname, String username) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8701/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'name': name,
        'surname': surname,
        'username': username
      }),
    );

    if (response.statusCode == 200) {
      if(passwordController.text == confirmPasswordController.text) {
        // Login riuscito, naviga alla homepage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registrazione completata'),
              content: const Text('Utente inserito con successo, effettua il login'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Login fallito, mostra un messaggio di errore
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registrazione fallita'),
              content: const Text('Le password non corrispondono'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }

    } else {
      // Login fallito, mostra un messaggio di errore
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registrazione fallita'),
            content: const Text('Qualcosa è andato storto'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Username(usernameController: usernameController),
        Name(nameController: nameController),
        Surname(surnameController: surnameController),
        Mail(emailController: emailController,),
        Password(passwordController: passwordController),
        ConfirmPassword(confirmPasswordController: confirmPasswordController),

        _submit(),
      ],
    );
  }

  Center _submit() {
    return Center(
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          register(emailController.text, passwordController.text, nameController.text, surnameController.text, usernameController.text);
        },
        child: const Text('REGISTRATI',style: (TextStyle(fontSize: 20)),),
      ),
    );
  }
}

class AlreadyRegisteredRedirect extends StatelessWidget {
  const AlreadyRegisteredRedirect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Logo()),
            );
          }
        },
        child: const Text('Sei già registrato? Clicca qui',
          style: TextStyle(color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white),),
      ),
    );
  }
}



class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({
    required this.confirmPasswordController,
    super.key,
  });


  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('Conferma Password',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.passwordController,
  });


  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Mail extends StatelessWidget {
  const Mail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Indirizzo mail',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Username extends StatelessWidget {


  const Username({
    super.key,
    required this.usernameController,
  });


  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Username',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class Name extends StatelessWidget {


  const Name({
    super.key,
    required this.nameController,
  });


  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Surname extends StatelessWidget {


  const Surname({
    super.key,
    required this.surnameController,
  });


  final TextEditingController surnameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Surname',
            style: TextStyle(color: Colors.white, fontSize: 20),),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Registrati',
        style: TextStyle(color: Colors.white, fontSize: 40),),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 70, 0, 100),

      child: Image.asset(
        'assets/images/logo.png', color: Colors.white,
        scale: 0.5,),
    );
  }
}