import 'package:flutter/material.dart';

class MyRefresh extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;


  const MyRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  State<MyRefresh> createState() => _MyRefreshState();
}

class _MyRefreshState extends State<MyRefresh> {
  Future<void> Function() get onRefresh => widget.onRefresh;
  Widget get child => widget.child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: child,
          )
        )
    );
  }
}
