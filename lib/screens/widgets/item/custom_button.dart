import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../style_app/color_app.dart';
import '../../style_app/style_text.dart';

Widget CustomButton({
  Color? color,
  Color? textColor,
  required String title,
  BorderSide borderSide = BorderSide.none,
  Function()? onTap,
  bool isLoad = false,
}) {
  return AppButton(
    onTap: isLoad ? (){} : onTap,
    color: color ?? ColorApp.blue02,
    elevation: 0,
    shapeBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: borderSide,
    ),
    child: isLoad
        ? CircularProgressIndicator(
                color: textColor ?? Colors.white, strokeWidth: 2)
            .withSize(height: 20, width: 20)
        : Text(
            title,
            style: StyleApp.textStyle700(
              fontSize: 16,
              color: textColor ?? Colors.white,
            ),
          ),
  );
}
