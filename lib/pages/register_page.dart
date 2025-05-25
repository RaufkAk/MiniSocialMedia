import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/components/my_button.dart';
import 'package:mini_social_media/components/my_texfield.dart';
import '../helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmingController = TextEditingController();
//register method
  void registerUser() async{
    //show loading circle
    showDialog(
      context: context,
      builder: (dialogContext) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //make sure passwords match
    if (passwordController.text != confirmingController.text) {
      //pop loading circle
        Navigator.pop(context);
      //show error message to user
      displayMessageToUser("Passwords Don't Match", context);
      return;
    }//if password do match
    else{
      try{
        //create user
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
          //create a user document and add to firestore
       await createUserDocument(userCredential);

        //pop loading circle
        if(context.mounted)
        Navigator.pop(context);

      }on FirebaseAuthException catch(e){
        //pop loading circle
        Navigator.pop(context);
        //show error message to user
        displayMessageToUser(e.code, context);
      }

    }
  }
  //create a user document and collect them in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      String uid = userCredential.user!.uid;
      String email = userCredential.user!.email!;
      String username = usernameController.text.trim();

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .set({
        'uid': uid,
        'email': email,
        'username': username,
        'createdAt': Timestamp.now(),
      });
    }
  }


  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              const Text(
                "M I N I   S O C I A L   M E D I A",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              MyTexfield(
                hintText: "User Name",
                obscureText: false,
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              MyTexfield(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              MyTexfield(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              MyTexfield(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmingController,
              ),
              const SizedBox(height: 20),
              MyButton(
                onTap: registerUser,
                text: "Register",
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  "Already have an account? Log in here.",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}