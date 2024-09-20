

import 'package:flutter/material.dart';
import 'package:mvvm/res/components/color.dart';

class roundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const roundButton({required this.title,this.loading=false,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(title,style: TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
