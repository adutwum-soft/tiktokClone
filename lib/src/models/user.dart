import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String prifilePhoto;
  String email;
  String uid;

  User({
    required this.name,
    required this.prifilePhoto,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "prifilePhoto": prifilePhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapshot['email'],
        name: snapshot['name'],
        prifilePhoto: snapshot['prifilePhoto'],
        uid: snapshot['uid']);
  }
}
