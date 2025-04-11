import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyphoneViewBody extends StatelessWidget {
  const VerifyphoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(Assets.imagesImageInonboarding),
            const SizedBox(height: 20),
            Text(
              'من فضلك أدخل كود التحقق',
              style: TextStyles.fakrnitext.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                autoFocus: true,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: Colors.black,
                  selectedColor: Colors.deepPurple,
                  inactiveColor: Colors.grey,
                ),
                onChanged: (value) {},
                onCompleted: (code) {
                  context.read<AuthinticationCubit>().signInWithSmsCode(
                     code,
                  );
                  // هنا تستدعي cubit وتبعت الكود
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
