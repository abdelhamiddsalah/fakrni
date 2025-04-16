import 'package:fakrni/features/home/domain/entities/challenge_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // تأكد من استيراد Firestore

class ChallengeModel extends ChallengeEntity {
  ChallengeModel({required super.challengename, required super.challengeid, required super.image});

  // تحويل المستند من Firestore إلى نموذج
  factory ChallengeModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChallengeModel(
      challengename: data['challengename'] as String,
      challengeid: data['challengeid'] as int,
      image: data['image'] as String,
    );
  }

  // تحويل النموذج إلى شكل يمكن إرساله إلى Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'challengename': challengename,
      'challengeid': challengeid,
      'image': image,
    };
  }
}
