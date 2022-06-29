import 'package:flutter/cupertino.dart';
import 'package:machine/Src/Constant/color_const.dart';

TextStyle textStyle({
  required BuildContext context,
}) {
  return TextStyle(
    color: ColorConst.black,
    fontSize: MediaQuery.of(context).size.height * 0.023,
  );
}
