import 'package:flutter/material.dart';

import '../../dimension/size.dart';

class ContainerShape {
  static RoundedRectangleBorder rectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      ContentSize.roundedBorderSize,
    ),
  );
}
