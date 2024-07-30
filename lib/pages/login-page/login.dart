
import 'package:flutter/material.dart';
import 'package:riproduzione_app_altrefiamme/pages/homepage/homepage.dart';

import '../register-page/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Indirizzo mail',style: TextStyle(color: Colors.white,fontSize: 20),),
                    TextField(
                      decoration: InputDecoration(

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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password',style: TextStyle(color: Colors.white,fontSize: 20),),
                    TextField(
                      decoration: InputDecoration(

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title:'Riproduzione Altrefiamme')),
                    );
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
                          builder: (context) => const Register()),
                    );
                  },
                  child: Text('Non sei registrato? Clicca qui',style: TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                ),
              )
            ]
          )
        ),
      ),
    );
  }

}