import 'package:flutter/material.dart';

import '../../colors/list_color.dart';

class DecorationContainer {
  static BoxDecoration boxDecorationDefault = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ConstantColors.gradientTopColor, // #08F4F9
        ConstantColors.gradientBottomColor
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
