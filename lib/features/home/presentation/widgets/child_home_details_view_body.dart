import 'dart:async';

import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/features/home/data/models/challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildHomeDetailsViewBody extends StatefulWidget {
  const ChildHomeDetailsViewBody({super.key, required this.challengeModel});
  final ChallengeModel challengeModel;

  @override
  _ChildHomeDetailsViewBodyState createState() =>
      _ChildHomeDetailsViewBodyState();
}

class _ChildHomeDetailsViewBodyState extends State<ChildHomeDetailsViewBody> {
  int _start = 60; // 1 minute in seconds (60 seconds)
  double _progress = 0.0;
  bool isStarted = false; // Variable to track if the challenge has started
  bool isCompleted = false; // Variable to track if the task is completed
  bool isLost = false; // Variable to track if the user lost (time is up)
  Timer? _timer;  // Initialize as null to avoid late initialization

  @override
  void dispose() {
    _timer?.cancel();  // Safely cancel the timer if it's initialized
    super.dispose();
  }

  void startTimer() {
    if (_timer != null && _timer!.isActive) {
      return;  // Don't start the timer again if it's already running
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          _timer?.cancel();
          isLost = true;  // If the time is up, mark as lost
        } else {
          _start--;
          _progress = 1.0 - (_start / 60); // Calculate progress for 60 seconds
        }
      });
    });
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void completeTask() {
    setState(() {
      isCompleted = true;
    });
    // Here you can calculate points based on the time taken or any other criteria
    int points = (_start > 0) ? (_start * 10) : 100;  // Example calculation
    // You can display the points or save them in the user's profile, etc.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('مبروك!'),
        content: Text('لقد أكملت التحدي وحصلت على $points نقطة.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.textColor,
                width: 1,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('فكرني', style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop(); // Navigate back to previous screen
                        },
                        child: Icon(Icons.arrow_forward, color: AppColors.textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    Assets.imagesBoy, // Ensure you have this image asset
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Text(widget.challengeModel.challengename, style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                  SizedBox(height: 20),
                  Divider(color: AppColors.textColor, thickness: 1),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1- أقرأ التحدي و أفهمه كويس', style: TextStyles.fakrnitext.copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                      Text('2- كل تحدي ليه مده معينه', style: TextStyles.fakrnitext.copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                      Text('3- شوف الوقت المناسب للتحدي و أبدا فيه', style: TextStyles.fakrnitext.copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                      Text('4 - حاول تكسب أكبر عدد من النقاط ', style: TextStyles.fakrnitext.copyWith(fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.grey[300],
                    color: AppColors.secondColor,
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.secondColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: 150,
                    child: Text(timerText, style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (!isStarted) {
                        setState(() {
                          isStarted = true;
                          startTimer(); // Start the timer when button is pressed
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: 150,
                      height: 70,
                      child: Text(isStarted ? 'التحدي بدأ' : 'أبدا التحدي', style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (isStarted && !isCompleted)
                    InkWell(
                      onTap: completeTask,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondColor,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: 150,
                        height: 70,
                        child: Text('أكمل المهمة', style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                      ),
                    ),
                  SizedBox(height: 20),
                  // If time is up and task is not completed, show "خسر"
                  if (isLost && !isCompleted)
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLost = true;  // Mark as lost
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: 150,
                        height: 70,
                        child: Text('خسر', style: TextStyles.fakrnitext.copyWith(fontSize: 20)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
