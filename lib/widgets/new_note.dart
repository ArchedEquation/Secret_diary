import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});
  @override
  State<NewNote> createState() {
    return _NewNoteState();
  }
}

class _NewNoteState extends State<NewNote> {
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submitnote() async {
    final enteredNote = _noteController.text;
    if (enteredNote.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    _noteController.clear();
    final user = FirebaseAuth.instance.currentUser!;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    await FirebaseFirestore.instance.
    collection('note').
    add({
      'text':enteredNote,
      'createdAt':Timestamp.now(),
      'userId':user.uid,
      'username':userData.data()!['username'],
      'userImage':userData.data()!['imageurl']
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _noteController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3,color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0)
                ),
                  labelText: 'Enter your todays experiences '),
            ),
          ),
          IconButton(
              onPressed: _submitnote,
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
