import 'package:flutter/material.dart';

class HPGradView extends StatelessWidget {
 final int? itemCount;
 final SliverGridDelegate gridDelegate;
 final Widget? Function(BuildContext, int) itemBuilder;
 final EdgeInsetsGeometry? padding;
  

  const HPGradView({super.key, required this.itemCount, required this.gridDelegate, required this.itemBuilder,  this.padding,});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: gridDelegate,
      itemBuilder: itemBuilder,
      padding: padding ,  
    );
  }
}
