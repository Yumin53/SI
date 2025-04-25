import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'fireauth.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
  FirebaseFirestore.instance.collection('notes');

  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<dynamic> getUserData(String property) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.email)
          .get();

      if (userDoc.exists) {
        return await userDoc.get(property);
      } else {
        throw Exception('no $property for the user!');
      }
    } catch (e) {
      FireauthService().displayError(e.toString());
      return 'no $property';
    }
  }

  // CREATE
  Future<void> addUser(
      String email,
      String name,
      ) async {
    await FirebaseFirestore.instance.collection('Users')
        .doc(email)
        .set({
      'email': email,
      'name': name,
      'timestamp': Timestamp.now(),
    });
  }


  // READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
    notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  // UPDATE
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}