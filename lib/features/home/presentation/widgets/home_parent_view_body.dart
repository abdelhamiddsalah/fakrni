/*import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/features/authintication/presentation/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeParentViewBody extends StatelessWidget {
  const HomeParentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
             ArrowBack(),
                   const SizedBox(width: 20),
                
            const SizedBox(height: 120),
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lotties/Animation - 1744372417043.json',
                      width: 220,
                      height: 230,
                      fit: BoxFit.fill),
                      SizedBox(height: 20,),
                  Text('لم يوجد أطفال مسجلين بعد',
                      style:TextStyles.fakrnitext.copyWith(
                        fontSize: 20,
                      )),
                ],
              ),
             ),
          ],
        ),
      )),
    );
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/features/authintication/presentation/widgets/arrow_back.dart';
import 'package:lottie/lottie.dart';

class HomeParentViewBody extends StatelessWidget {
  const HomeParentViewBody({super.key});

  Future<List<Map<String, dynamic>>> fetchChildren() async {
    final parentId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('parents')
        .doc(parentId)
        .collection('childrens')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<List<Map<String, dynamic>>>( 
            future: fetchChildren(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final children = snapshot.data ?? [];

              if (children.isEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    ArrowBack(),
                    const SizedBox(height: 120),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/lotties/Animation - 1744372417043.json',
                            width: 220,
                            height: 230,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'لم يوجد أطفال مسجلين بعد',
                            style: TextStyles.fakrnitext.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              // ترتيب الأطفال تنازلياً حسب النقاط
              children.sort((a, b) {
                final pointsA = a['points'] ?? 0;
                final pointsB = b['points'] ?? 0;
                return pointsB.compareTo(pointsA); // ترتيب تنازلي
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ArrowBack(),
                  const SizedBox(height: 40),
                  Text(
                    'نقاط الأطفال حسب الأنشطة',
                    style: TextStyles.fakrnitext.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 30),
                  // عرض الرسومات البيانية مع الأسماء تحتها
                  Expanded(
                    child: ListView.builder(
                      itemCount: children.length,
                      itemBuilder: (context, index) {
                        final child = children[index];
                        final points = child['points'] ?? 0;

                        return Column(
                          children: [
                            // رسم بياني للطفل
                            Container(
                              height: 300, // تحديد الارتفاع
                              child: BarChart(
                                BarChartData(
                                  barTouchData: BarTouchData(enabled: true),
                                  alignment: BarChartAlignment.center,
                                  maxY: children
                                          .map((e) => (e['points'] ?? 0) as num)
                                          .reduce((a, b) => a > b ? a : b)
                                          .toDouble() +
                                      10,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 10,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(fontSize: 12),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(show: true),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: points.toDouble(),
                                          width: 18,
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // عرض اسم الطفل تحت الرسم البياني
                            SizedBox(height: 10),
                            Text(
                              child['firstname'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 20), // مساحة إضافية بين العناصر
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
