import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_back_button.dart';
import '../components/my_list_tile.dart';
import '../database/firestore.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

   final FirestoreDatabase database = FirestoreDatabase();
  //current logged in user

   final currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch  user details
   Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async {
     return await FirebaseFirestore.instance
         .collection("Users")
         .doc(currentUser!.uid)
         .get();

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
        future : getUserDetails(),
        builder: (context,snapshot){
          // loading..
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );

          }
          //error
          else if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          //data received
          else if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic>? user = snapshot.data!.data();
            if (user == null) {
              return const Center(
                  child: Text("Dont Find any user ")
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  // back button
                  const Padding(
                    padding:  EdgeInsets.only(
                        top: 50.0,
                      left: 25,
                    ),
                    child: Row(
                      children: [
                        MyBackButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),

                  //profile pic
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(24),

                    ),
                    padding:const EdgeInsets.all(25),
                    child: const Icon(Icons.person, size: 64,),
                  ),
                  const SizedBox(height: 25,),
                  //username
                  Text(user!['username'],
                      style:TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //email
                  Text(
                      user['email'],
                    style:  TextStyle(
                        color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,bottom:0,top: 25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "My Posts",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: database.getUserPostsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text('Hata: ${snapshot.error}'));
                        }

                        if (snapshot == null) {
                          return const Text("No Data");
                        }

                        final userPosts = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: userPosts.length,
                          itemBuilder: (context, index) {
                            final post = userPosts[index].data();
                            final message = post['message'];
                            final email = post['UserEmail'];

                            return MyListTile(
                              title: message,
                              subtitle: email,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}