
import 'package:mini_social_media/components/my_post_button.dart';
import 'package:mini_social_media/components/my_texfield.dart';
import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/my_list_tile.dart';
import '../database/firestore.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

   //firestore access
   final FirestoreDatabase database = FirestoreDatabase();

//text controller
 final TextEditingController newPostController = TextEditingController();

 void postMessage(){
   // only post message if there is something to post
   if(newPostController.text.isNotEmpty){
     String message = newPostController.text;
     database.addPost(message);

   }
   //clear the controller
   newPostController.clear();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text("F E E D",),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,

      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //TextField Box For User To Type
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                //textfield
                Expanded(
                  child: MyTexfield(
                      hintText: "Say Something",
                      obscureText: false,
                      controller: newPostController
                  ),
                ),
                //post button
                MyPostButton(
                    onTap: postMessage  ,
                )

              ],
            ),
          ),

          //Posts
          StreamBuilder(
              stream: database.getPostsStream(),
              builder: (context,snapshot){
                //show loading circle
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //get all post
                final posts = snapshot.data!.docs;

                //no data ?
                if(snapshot.data == null || posts.isEmpty){
                  return const Center(
                   child: Padding(
                       padding: EdgeInsets.all(25),
                     child: Text("No Posts .. Post Something!"),
                   ),
                  );

                }
                //return as a list
                return Expanded(
                    child:ListView.builder(
                      itemCount: posts.length,
                        itemBuilder: (context,index){
                          // get each individual post
                          final post = posts[index];

                          //get data from each post
                          String message = post['message'];
                          String userEmail = post['UserEmail'];

                          //return as a list tile
                          return MyListTile(
                               title: message,
                              subtitle: userEmail,
                          );
                        }
                    ),
                );

              },
          )
        ],
      ),
    );
  }
}
