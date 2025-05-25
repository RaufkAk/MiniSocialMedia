import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/components/my_button.dart';
import 'package:mini_social_media/components/my_texfield.dart';

import '../helper/helper_functions.dart';

class LoginPage extends StatefulWidget {



 final void Function()? onTap;

  LoginPage({super.key, required this.onTap,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//LogIn Method
  void login() async{
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
        child: CircularProgressIndicator(),
        )
    );
    //try sign in
    try{
      await FirebaseAuth .instance.signInWithEmailAndPassword(
      email: emailController.text,
          password: passwordController.text,
      );
      //pop loading circle
      if(context.mounted)
        Navigator.pop(context);
    }//display any errors
    on FirebaseAuthException catch(e){
      //pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  //text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //LOGO
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              //AppName
              const SizedBox(height: 25),
              Text(
                "M I N I   S O C I A L   M E D I A",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 50),

              //Email TextField
              MyTexfield(
                  hintText:"Email",
                  obscureText: false,
                  controller: emailController,
              ),
              const SizedBox(height: 10),

              //Password
              MyTexfield(
                hintText:"Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),
              //Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Text("Forgat Password ? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 25),


              //Sign In Button
              MyButton(text: "Login",
                  onTap: login,
              ),

              const SizedBox(height: 25),
              //dont have an account - register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
