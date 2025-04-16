import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabases {
  final FirebaseFirestore firestore;

  FirestoreDatabases(this.firestore);

  CollectionReference get children => firestore.collection('children');
  CollectionReference get challenges => firestore.collection('challenges');
}
