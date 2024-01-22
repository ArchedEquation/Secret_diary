import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class NoteDisplay extends StatelessWidget {
  NoteDisplay({super.key});
  final authenticatedUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('note')
          .orderBy('createdAt', descending: false)
          .snapshots(),
      builder: (ctx, noteSnapshots) {
        if (noteSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!noteSnapshots.hasData || noteSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages found'),
          );
        }
        if (noteSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        final loadedNotes = noteSnapshots.data!.docs;
        return ListView.builder(
            itemCount: loadedNotes.length,
            itemBuilder: (ctx, index) {
              final notes = loadedNotes[index].data();

              final currentNoteid = notes['userId'];
              return Container(
                height: 250,
                width: 250,
                child: Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Center(
                      child: Text(
                    notes['text'],
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              );
            });
      },
    );
  }
}
