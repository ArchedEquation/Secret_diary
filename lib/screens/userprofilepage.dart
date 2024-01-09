import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfilePage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6fff2),
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text('P R O F I L E'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          var userDocument = snapshot.data;

          if (userDocument == null) {
            return Center(
              child: Text('No user data found'),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0.0, -100.0, 0.0),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(userDocument['imageurl']),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(),
                  elevation: 0,
                  color: Colors.transparent,
                  margin: const EdgeInsets.all(12.0),
                  child: Text(
                    'Name: ${userDocument['username']}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),

                Transform(
                  transform: Matrix4.translationValues(0, -100, 0),
                  child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      margin: const EdgeInsets.all(12.0),
                      child: Text(
                        'Email: ${userDocument['email']}',
                        style: const TextStyle(fontSize: 24),
                      )),
                ),
                // Add more user details as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
