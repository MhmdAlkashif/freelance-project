import 'package:flutter/material.dart';

class PrinterItem {
  final String value;
  final Widget widget;

  PrinterItem({required this.value, required this.widget});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is PrinterItem && value == other.value);

  @override
  int get hashCode => value.hashCode;
}
