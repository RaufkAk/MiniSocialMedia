import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_media/components/my_list_tile.dart';

import '../components/my_back_button.dart';
import '../helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context,snapshot){
            // any error
            if(snapshot.hasError){
              displayMessageToUser("Something went wrong", context);
            }
            //show loading circle
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot == null){
              return const Text("No Data");
            }
            //get all users
            final users = snapshot.data!.docs;

            return Column(
              children: [
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

                //user list
                Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context,index) {
                        //get individual user
                        final user = users[index];

                        //
                        String username = user['username'];
                        String email = user['email'];
                        return MyListTile(
                            title: username,
                            subtitle: email
                        );

                      },
                  ),
                ),
              ],
            );
          },
      ),
    );
  }
}
