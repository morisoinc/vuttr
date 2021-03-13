import 'package:flutter/material.dart';

import 'colors.dart';

enum VTheme {
  lightBlue,
  lightGreen,
}

ThemeData buildTheme(VTheme theme) {
  ThemeData base = ThemeData.light();
  base = base.copyWith(
    scaffoldBackgroundColor: kWhite,
    errorColor: kRed,
    cardTheme: _kCardMainElevation1Theme,
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    ),
  );

  switch (theme) {
    case VTheme.lightGreen:
      return _buildColorDependentThemeData(
          theme: base,
          primary: kGreen,
          lighter: kLighterGreen,
          darker: kDarkerGreen);
    default:
      return _buildColorDependentThemeData(
          theme: base,
          primary: kBlue,
          lighter: kLighterBlue,
          darker: kDarkerBlue);
  }
}

ThemeData _buildColorDependentThemeData({
  @required ThemeData? theme,
  @required Color? primary,
  @required Color? lighter,
  @required Color? darker,
}) {
  return theme!.copyWith(
    accentColor: primary,
    primaryColor: lighter,
    buttonTheme: ButtonThemeData(splashColor: darker),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
      backgroundColor: primary,
      splashColor: darker,
      focusColor: darker,
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 24.0),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
        ),
      )
      .apply(
        fontFamily: 'SourceSansPro',
        displayColor: kInk,
        bodyColor: kInk,
      );
}

final _kCardMainElevation1Theme = CardTheme(
  color: kWhite,
  shadowColor: kCardShadow,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);
