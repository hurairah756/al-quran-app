// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  bool? isArrowLeft;
  VoidCallback? onTap;
  ButtonBack(this.onTap, {super.key, this.isArrowLeft});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isArrowLeft == false
          ? Image.asset(
              "assets/icon/ic_back.png",
              fit: BoxFit.cover,
              width: 30,
              height: 30,
            )
          : Image.asset(
              "assets/icon/ic_back_left.png",
              fit: BoxFit.cover,
              width: 30,
              height: 30,
            ),
    );
  }
}
