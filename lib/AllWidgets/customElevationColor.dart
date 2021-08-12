import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget? child;

  CustomElevation({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(255, 204, 0, 1).withOpacity(0.1),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
