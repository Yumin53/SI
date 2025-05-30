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
      'streak': 0,
      'timestamp': Timestamp.now(),
    });
  }

  // Helper function
  String getMMDDYYYY(DateTime date) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String month = twoDigits(date.month);
    String day = twoDigits(date.day);

    return month + day + "${date.year}";
  }

  void updateStreak(
        DateTime today,
      ) async {

    int streak = await getUserData('streak');  // Call the function from the imported file
    final lastUserUpdate = await getUserData('lastUpdate');
    DateTime lastUpdate = DateTime.fromMicrosecondsSinceEpoch(lastUserUpdate.seconds * 1000000);
    bool onStreak = false;
    const monthsWith31 = [1,3,5,7,8,10,12];
    const monthsWith30 = [4,6,9,11];

    final isLeapYear = lastUpdate.year % 400 == 0 ||
        (lastUpdate.year % 4 == 0 && lastUpdate.year % 100 != 0);

    if (lastUpdate.year == today.year) {
      if (lastUpdate.month == today.month) {
        onStreak = (today.day - lastUpdate.day == 1);
      }
      else if (today.month - lastUpdate.month == 1 && today.day == 1) {
        if (monthsWith31.contains(lastUpdate.month)) {
          onStreak = lastUpdate.day == 31;
        } else if (monthsWith30.contains(lastUpdate.month)) {
          onStreak = lastUpdate.day == 30;
        } else {
          onStreak = isLeapYear ? lastUpdate.day == 29 : lastUpdate.day == 28;
        }
      }
    } else {
      onStreak = (today.year - lastUpdate.year == 1)
          && (lastUpdate.month == 12) && (lastUpdate.day == 31)
          && (today.month == 1) && (today.day == 1);
    }
    streak = getMMDDYYYY(today) == getMMDDYYYY(DateTime.now()) ? streak + 1: 1;
    // streak = onStreak ? streak + 1 : 1;

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email).set({
      'streak': streak,
      'lastUpdate': DateTime.now(),
    }, SetOptions(merge: true));
  }

  // CREATE
  Future<void> updateDiary(
      int? flowerIndex,
      String diary,
      DateTime selectedDate,
      ) async {
    if (currentUser == null
        || currentUser!.email == null
    ) {
      return;
    }

    final today = DateTime.now();
    if (getMMDDYYYY(today) == getMMDDYYYY(selectedDate)) {
      updateStreak(today);
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .collection('Diary')
        .doc(getMMDDYYYY(selectedDate))
        .set({
      'flowerIndex': flowerIndex,
      'diary': diary
    }, SetOptions(merge: true));
  }

  // READ
  Future<dynamic> getDiary(DateTime selectedDate) async {
    String mmddyyyy = getMMDDYYYY(selectedDate);

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .collection('Diary')
        .doc(mmddyyyy)
        .get();

    if (userDoc.exists) {
      return userDoc;
    } else {
      return;
    }
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