import 'package:flutter/material.dart';

class Sheet extends StatelessWidget {
  final Widget child;

  const Sheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )
      ),
      child: child,
    );
  }
}
