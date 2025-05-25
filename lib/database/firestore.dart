import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
This Database stores post.
It is stored in a collection called "Posts" in Firebase

Each post contains;
- a message
- email of user
- timestamp
*/

class FirestoreDatabase {
  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of post from firestore
  final CollectionReference posts =
  FirebaseFirestore.instance.collection("Posts");

  // post a message
  Future<void> addPost(String message) async {
    await posts.add({
      'UserEmail': user!.email,
      'message': message,
      'timestamp': Timestamp.now(),
    });
  }

// read posts from database
Stream<QuerySnapshot> getPostsStream(){
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('timestamp',descending: true)
        .snapshots();
    return postStream;
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserPostsStream() {
    final currentUser = FirebaseAuth.instance.currentUser;

    return FirebaseFirestore.instance
        .collection('Posts')
        .where('UserEmail', isEqualTo: currentUser?.email)
        .snapshots();
  }
}