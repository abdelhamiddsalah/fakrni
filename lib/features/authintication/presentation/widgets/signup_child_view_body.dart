import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:fakrni/core/widgets/textformfield_in_auth.dart';
import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/authintication/presentation/widgets/arrow_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupChildViewBody extends StatefulWidget {
  const SignupChildViewBody({super.key});

  @override
  State<SignupChildViewBody> createState() => _SignupChildViewBodyState();
}

class _SignupChildViewBodyState extends State<SignupChildViewBody> {
  String? selectedAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ الدوائر في الأسفل
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    const Positioned(
                      bottom: -12,
                      left: -12,
                      child: CircleAvatar(radius: 40, backgroundColor: Color(0xfff0a790)),
                    ),
                    Positioned(
                      bottom: -20,
                      left: 20,
                      child: CircleAvatar(radius: 50, backgroundColor: const Color(0xff4c9bb9).withOpacity(0.5)),
                    ),
                    Positioned(
                      bottom: 50,
                      left: -30,
                      child: CircleAvatar(radius: 30, backgroundColor: Colors.tealAccent.shade100.withOpacity(0.5)),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 30,
                      child: CircleAvatar(radius: 35, backgroundColor: Colors.red.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ المحتوى الرئيسي
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const ArrowBack(),
                      const SizedBox(height: 40),
                      Image.asset(Assets.imagesImageInonboarding, width: 100, height: 100),
                      const SizedBox(height: 20),
                      Text(
                        'مرحبًا يا بطل! أدخل اسمك وسنك',
                        style: TextStyles.fakrnitext.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      TextformfieldInAuth(
                        hintText: 'اسمك',
                        controller: context.read<AuthinticationCubit>().nameController,
                      ),
                      const SizedBox(height: 20),
                      TextformfieldInAuth(
                        hintText: 'اسم الاب',
                        controller: context.read<AuthinticationCubit>().fatherNameController,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonFormField<String>(
                          value: selectedAge,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.textColor,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          hint: Text(
                            'اختر سنك',
                            style: TextStyles.fakrnitext.copyWith(fontSize: 16, color: AppColors.secondColor),
                          ),
                          dropdownColor: AppColors.textColor,
                          style: const TextStyle(
                            color: AppColors.secondColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          items: ['5', '6', '7', '8'].map((age) {
                            return DropdownMenuItem<String>(
                              value: age,
                              child: Text(age),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAge = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 50),

                      BlocConsumer<AuthinticationCubit, AuthinticationState>(
                        listener: (context, state) {
                          if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          } else if (state is ChildDataSaved) {
                            GoRouter.of(context).push(AppRoutes.childhome);
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const CircularProgressIndicator(color: AppColors.mainColor);
                          }

                          return ButtonForNav(
                            onTap: () {
                              final name = context.read<AuthinticationCubit>().nameController.text.trim();
                              final fatherName = context.read<AuthinticationCubit>().fatherNameController.text.trim();

                              if (name.isNotEmpty && fatherName.isNotEmpty && selectedAge != null) {
                                final child = ChildEntity(
                                  firstname: name,
                                  lastname: fatherName,
                                  age: int.tryParse(selectedAge!) ?? 0,
                                  id: '${DateTime.now().millisecondsSinceEpoch}',
                                );

                                context.read<AuthinticationCubit>().saveChildData(
                                      child,
                                      FirebaseAuth.instance.currentUser?.uid ?? 'unknown',
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('من فضلك املأ جميع الحقول')),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
