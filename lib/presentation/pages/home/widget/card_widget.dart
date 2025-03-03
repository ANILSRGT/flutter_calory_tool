import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,

    this.color = Colors.white,
    this.child,
  });


  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppValues.lg.ext.radius.border.all,
      child: Container(
        padding: AppValues.md.ext.padding.all,

        color: color,
        child: child,
      ),
    );
  }
}
