//import '../constants/assets.dart';
//import 'package:flutter/material.dart';

class Box {
   final String name;
  final String imageUrl;
  bool selected;

  Box({
     this.name,
    this.imageUrl,
    this.selected,
  });
 

  static List<Box> get list {
    return [
      Box(
        name: 'maEnd',
        imageUrl:'assets/maEnd.webp',
      ),
      Box(
        name: 'maMiddelToEnd',
        imageUrl: 'assets/maMiddelToEnd.webp',
      ),
      Box(
        name: 'maMiddle',
        imageUrl: 'assets/maMiddle.webp' ,
      ),
      Box(
        name: 'maStart',
        imageUrl: 'assets/maStart.webp',
      ),
         
      ];
  }
}
