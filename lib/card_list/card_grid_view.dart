import 'package:exercices/Cards.dart';
import 'package:flutter/material.dart';
import '../card_list/card_item.dart';

class CardGrid extends StatefulWidget {
  const CardGrid({Key key, this.cards}) : super(key: key);
  final List<Card0> cards;

  @override
  _CardGridState createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
     shrinkWrap: true,
      itemCount: widget.cards.length,
      
     gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
       childAspectRatio: 160 / 200,
       
        crossAxisCount: 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      
      itemBuilder: (context, index) => CardItem(
        card: widget.cards[index],
      ),
    );
  }
}
