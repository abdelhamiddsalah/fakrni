import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabases {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference children = FirebaseFirestore.instance.collection('children');
  
}