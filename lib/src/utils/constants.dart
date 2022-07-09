import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Constants {
  static String proImg =
      'https://png.pngitem.com/pimgs/s/130-1300400_user-hd-png-download.png';

  // FIREBASE
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseStorage = FirebaseStorage.instance;
  var firestore = FirebaseFirestore.instance;
}
