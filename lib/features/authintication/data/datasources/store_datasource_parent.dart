import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';
import 'package:fakrni/features/authintication/domain/entities/user_entity.dart';


abstract class FirestoreRemoteDataSource {
  Future<void> saveParentData(UserEntity user);
  Future<void> saveChildData(ChildEntity childEntity);
}

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  final FirebaseFirestore firestore;

  FirestoreRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> saveParentData(UserEntity user) async {
    await firestore.collection('parents').doc(user.uid).set({
      'uid': user.uid,
      'phoneNumber': user.phoneNumber,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
  
  @override
  Future<void> saveChildData(ChildEntity childEntity) async{
    await firestore.collection('parents').doc().collection('childrens').doc(childEntity.id).set({
     'id':childEntity.id,
     'firstname':childEntity.firstname,
     'lastname':childEntity.lastname
    });
  }
}
