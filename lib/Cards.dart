//import '../constants/assets.dart';


//import 'package:flutter/material.dart';

class Card0 {
   final String name;
  final String imageUrl;
  bool selected;

  Card0({
     this.name,
    this.imageUrl,
    this.selected,
  });
 
static Card0 getcard(String name,List<Card0> cards){
  Card0 card;
for (var i = 0; i < cards.length; i++) {
    if (cards[i].name == name) {
      card=cards[i];
     return card;}
     else print("heeyy");
}

}
  static List<Card0> get list {
    return [
      Card0(
        name: 'pencil',
        imageUrl:'assets/pencilCard.webp',
      ),
      // Card0(
      //   name: 'radio',
      //   imageUrl: 'assets/radioCard.webp',
      // ),
      Card0(
        name: 'school',
        imageUrl: 'assets/schoolCard.webp' ,
      ),
      Card0(
        name: 'sun',
        imageUrl: 'assets/sunCard.webp',
      ),
      Card0(
        name: 'tiger',
        imageUrl: 'assets/tigerCard.webp',
      ),    
       Card0(
        name: 'tomate',
        imageUrl: 'tomatoesCard.webp',
       ),
       Card0(
        name: 'nurse',
        imageUrl: 'nurseCard.webp',
      ),
      ];
  }
}
