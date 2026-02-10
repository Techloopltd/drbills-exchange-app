import 'package:flutter/material.dart';

double drHeight(BuildContext context) => MediaQuery.of(context).size.height;

double drWidth(BuildContext context) => MediaQuery.of(context).size.width;

double drTopPadding(BuildContext context) => MediaQuery.of(context).padding.top;

double drBottomPadding(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom;

double drGap(double height, BuildContext context) {
  double vph = MediaQuery.of(context).size.longestSide;
  vph = vph > 812 ? 812 : vph;

  return height * (vph / 100);
}

double drSpace(double width, BuildContext context) {
  double vpw = MediaQuery.of(context).size.shortestSide;
  vpw = vpw > 375 ? 375 : vpw;

  return (width / 100) * vpw;
}

double drBox(double height, BuildContext context) {
  double vph = MediaQuery.of(context).size.longestSide;

  return height * vph / 812;
}

// const EdgeInsets kPadding = EdgeInsets.all(16.0);

// BorderRadius kBorderRadius = BorderRadius.circular(12);
