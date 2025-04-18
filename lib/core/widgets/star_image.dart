import 'package:fakrni/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarImage extends StatelessWidget {
  const StarImage({
    super.key, this.height, this.width,
  });
 final double? height;
 final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesImageInonboarding,
      width:width ?? 100.w,
      height: height ?? 100.h,
    );
  }
}
