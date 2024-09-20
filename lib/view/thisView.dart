

import 'package:flutter/material.dart';
import 'package:mvvm/view_model/thisView_model.dart';

class Thisview extends StatefulWidget {
   final thisViewModel viewModel ;
   Thisview( {required this.viewModel});


  @override
  State<Thisview> createState() => _ThisviewState();
}

class _ThisviewState extends State<Thisview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: (){

        },
          child: Text("passed Data:${widget.viewModel.data}")),),
    );
  }
}


