
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../register_page/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();


  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8701/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final accessToken = responseData['token'];

      // Memorizza il token in modo sicuro
      await storage.write(key: 'access_token', value: accessToken);

      // Login riuscito, naviga alla homepage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Riproduzione Altrefiamme'),
        ),
      );
    } else {
      // Login fallito, mostra un messaggio di errore
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Fallito'),
            content: const Text('Controlla le tue credenziali e riprova.'),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(40),
          color: Colors.red,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 100),

                child: Image.asset( 'assets/images/logo.png',color: Colors.white,scale: 0.5,),
              ),
              const Center(
                child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 40),),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),

                child:
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Indirizzo mail',style: TextStyle(color: Colors.white,fontSize: 20),),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),

                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password',style: TextStyle(color: Colors.white,fontSize: 20),),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    login(emailController.text, passwordController.text);
                  },
                  child: const Text('ACCEDI',style: (TextStyle(fontSize: 20)),),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Register(),
                    )
                    );
                  },
                  child: const Text('Non sei registrato? Clicca qui',style: TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}