import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secret_diary/widgets/message_bubble.dart';

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
              final nextnote = index + 1 < loadedNotes.length
                  ? loadedNotes[index + 1].data()
                  : null;
              final currentNoteid = notes['userId'];
              final nextnoteid = nextnote != null ? nextnote['userId'] : null;
              final nextuserissame = nextnoteid == currentNoteid;
              if (nextuserissame) {
                return MessageBubble.next(
                  message: notes['text'],
                  isMe: authenticatedUser.uid == currentNoteid,
                );
              } else {
                MessageBubble.first(
                  userImage: notes['userImage'],
                  username: notes['user'],
                  message: notes['text'],
                  isMe: authenticatedUser.uid == currentNoteid,
                );
              }
            });
      },
    );
  }
}
