import 'package:cconvert/provider/app_provider.dart';
import 'package:cconvert/shared/resources/colors.dart';
import 'package:cconvert/shared/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SizedBox freev({double v = 20}) {
  return SizedBox(
    height: v,
  );
}

SizedBox freeh({double h = 20}) {
  return SizedBox(
    width: h,
  );
}

ListTile defaultListTile(context,{
  required txt,
  trail,
  lead,
}) {
  bool mode = Provider.of<AppProvider>(context).isDark;
  return ListTile(
    title: Text(
      txt,
      style: getRegular(color: mode == false ? black : white),
    ),
    trailing: trail,
    leading: lead,
  );
}
