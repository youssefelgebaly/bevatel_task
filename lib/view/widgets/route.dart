import 'package:flutter/material.dart';

void navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
