import 'package:fakrni/features/home/data/models/challenge_model.dart';
import 'package:fakrni/features/home/presentation/widgets/child_home_details_view_body.dart';
import 'package:flutter/material.dart';

class ChiledHomeDetailsView extends StatelessWidget {
  const ChiledHomeDetailsView({super.key, required this.challengeModel});
  final ChallengeModel challengeModel;
  @override
  Widget build(BuildContext context) {
    return ChildHomeDetailsViewBody(challengeModel: challengeModel,);
  }
}
