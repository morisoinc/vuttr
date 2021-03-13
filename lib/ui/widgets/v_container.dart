import 'package:flutter/material.dart';
import 'package:vuttr/ui/global/colors.dart';

class VContainer extends StatelessWidget {
  final Widget child;

  VContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: new BoxDecoration(color: kWhite),
        child: child,
      ),
    );
  }
}
