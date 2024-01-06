// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AboutYouScreen extends StatefulWidget {
//   const AboutYouScreen({super.key});

//   @override
//   State<AboutYouScreen> createState() => _AboutYouScreenState();
// }

// class _AboutYouScreenState extends State<AboutYouScreen> {
//   List _userList = [];
//   var _username;
//   var _email;
//   var _profilePicUrl;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void initState() {
//     super.initState();
//     getUserData();
//   }

//   getUserData() async {
//     final user = _auth.currentUser;
//     if (user != null) {
//       final snapshots = _firestore.collection('users').doc(user.uid).get();
//       setState(() {
//         _username = snapshots.
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffe6fff2),
//       appBar: AppBar(
//         toolbarHeight: 150,
//         title: const Text('P  R  O  F  I  L  E'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).colorScheme.primary,
//                 Theme.of(context).colorScheme.primaryContainer
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _userList.length,
//         itemBuilder: ((context, index) {
//           _username = _userList[index]['username'];
//           _email = _userList[index]['email'];
//           _profilePicUrl = _userList[index]['imageurl'];
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(_profilePicUrl),
//               ),
//               title: Text(_username),
//               subtitle: Text(_email),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
