import 'dart:ui';
import 'package:flutter/material.dart';

Paragraph iconToParagraph(Icon iconWidget) {
  final icon = iconWidget.icon;
  var builder = ParagraphBuilder(ParagraphStyle(
    fontFamily: icon.fontFamily,
    fontSize: iconWidget.size,
  ))
    ..addText(String.fromCharCode(icon.codePoint));
  var para = builder.build();
  para.layout(const ParagraphConstraints(width: 60));

  return para;
}
