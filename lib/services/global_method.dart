import 'package:flutter/material.dart';

class GlobalMethods{
   navigateTo( {required BuildContext ctx, required String routeName}){
    Navigator.pushNamed(ctx, routeName);
  }
}