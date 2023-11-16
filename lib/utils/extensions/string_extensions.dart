import 'dart:math';

import 'package:flutter/material.dart';

extension StringNullExt on String? {
  bool get notNullOrEmpty => this != null && this!.isNotEmpty;

  bool get isValidSvgAsset {
    final lowercasedPath = this?.toLowerCase();
    return lowercasedPath?.endsWith('.svg') ?? false;
  }

  /// Creates a [TextPainter] and checks with the given [maxWidth]
  /// if the texts overflows, returning a [bool]
  bool hasTextOverflow({
    required TextStyle? style,
    required double maxWidth,
    double minWidth = 0,
    int maxLines = 4,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: maxLines,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }
}

extension StringExt on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get getFirstCharacters => substring(0, min(length, 30));
}

List<String> findStringDifferences(String text1, String text2) {
  final words1 = text1.split(' ');
  final words2 = text2.split(' ');

  final set1 = Set<String>.from(words1);
  final set2 = Set<String>.from(words2);

  final uniqueWords1 = set1.difference(set2);
  final uniqueWords2 = set2.difference(set1);

  final differences = <String>[];

  for (final word in uniqueWords1) {
    differences.add('- $word');
  }

  for (final word in uniqueWords2) {
    differences.add('+ $word');
  }

  return differences;
}
