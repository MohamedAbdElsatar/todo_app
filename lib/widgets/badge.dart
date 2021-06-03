import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
   
    required this.child,
    required this.value,
    this.color = Colors.white,
  }) ;

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.centerRight,
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              //ignore: unnecessary_null_comparison
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                 color : Theme.of(context).primaryColor
              ),
            ),
          ),
        )
      ],
    );
  }
}
