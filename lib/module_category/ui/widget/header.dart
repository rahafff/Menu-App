import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rightware/utils/images/images.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(ImageAsset.REST,fit: BoxFit.cover,)
        ],
      ),
    );
  }
}