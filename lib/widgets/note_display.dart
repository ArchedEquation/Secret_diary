import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteDisplay extends StatelessWidget {
  const NoteDisplay({super.key});
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
            itemBuilder: ((ctx, index) =>
                Text(loadedNotes[index].data()['text']))
                );
                
      },
    );
  }
}
