import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.color,
    this.child,
    this.elevation = 4.0,
  });

  final Color? color;
  final Widget? child;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: AppValues.lg.ext.radius.border.all,
      child: ClipRRect(
        borderRadius: AppValues.lg.ext.radius.border.all,
        child: Container(
          padding: AppValues.md.ext.padding.all,
          color: color,
          child: child,
        ),
      ),
    );
  }
}
