import 'package:flutter/material.dart';

import '../../style_app/style_text.dart';



Widget ItemLoadFaild({
  required String message,
  Function()? onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: StyleApp.textStyle400(),
        ),
        OutlinedButton(
          onPressed: onPressed,
          child: Text(
            "Tải lại",
            style: StyleApp.textStyle400(),
          ),
        ),
      ],
    ),
  );
}
