import 'package:flutter/material.dart';
import '../Cards.dart';

class CardItem extends StatelessWidget {
  const CardItem({@required this.card, Key key,}) : super(key: key);
  final Card0 card;

  @override
  Widget build(BuildContext context) {
    return Draggable<Card0>(
      feedback: _feedback,
      data: card,
      childWhenDragging: _childWhenDragging,
      //onDragStarted: () {},
      //onDragCompleted: () {},
     // onDraggableCanceled: (velocity, offset) {},
     child: _childWhileDragging,
    );
  }

  Widget get _feedback {
    return Material(
     color: Colors.transparent,
      // child: SizedBox(
      //   width: 100,
      //   height:100,
      //   child: Card(
           
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(500),
      //     ),
          child: Container(
            //width: 100,
            height: 180,
            child: Row(
              
              children: [
                Image.asset(
                    card.imageUrl,),
                // Padding(
                //   padding: const EdgeInsets.only(),
                //   child: Image.asset(
                //     card.imageUrl,
                //   ),
                // ),
               // const SizedBox(width: 8),
                //Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   Text(
                  //     furniture.name,
                  //     style: const TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //   ),
                  //   const SizedBox(height: 4),
                  //   // Text(
                  //   //   '${furniture.price.representablePrice}',
                  //   //   style: const TextStyle(
                  //   //     color: Colors.grey,
                  //   //     fontSize: 12,
                  //   //   ),
                  //   // )
                  // ],
                //)
              ],
            ),
          ),
    //     ),
    //   ),
     );
  }
Widget get _childWhenDragging{
  return Container( // color: Colors.transparent,
  );
}
  Widget get _childWhileDragging {
    return Container(
      color: Colors.transparent,
      // child: Card(
      //   child: Center( 
              child: Image.asset(
                card.imageUrl,
                height: 180,
              ),
            
            // Positioned(
            //   bottom: 20,
            //   left: 0,
            //   child: SizedBox(
            //     width: 120,
            //     height: 48,
            //     child: Text(
            //       card.name,
            //       textAlign: TextAlign.left,
            //       overflow: TextOverflow.clip,
            //       style: const TextStyle(
            //         fontSize: 17,
            //         fontWeight: FontWeight.w600,
            //         letterSpacing: .18,
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 4,
            //   left: 0,
              // child: Text(
              //   furniture.price.representablePrice,
              //   textAlign: TextAlign.left,
              //   overflow: TextOverflow.clip,
              //   style: const TextStyle(
              //     fontSize: 15,
              //     color: Colors.grey,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),
          //  )
          
       // ),
     // ),
    );
  }
}
