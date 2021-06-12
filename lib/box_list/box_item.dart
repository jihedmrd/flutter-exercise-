import 'package:flutter/material.dart';
import '../boxs.dart';

class BoxItem extends StatelessWidget {
  const BoxItem({@required this.box, Key key,}) : super(key: key);
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Container (
      child:_buildDragTarget(box),
    );
    // return DragTarget<Box>(
    //   builder: (context,List<Box> incoming,List rejected)
    //   {},
    //     onWillAccept: (data) => true,
    //     onAccept: (data) {
    //      //  setState(() {
    //       //plyr.play('assets/a7sant.mp3');
    //       print('vrai');
    //      //});
    //      },
    //      onLeave: (data) {
    //     //setState(() {
    //      // score[emoji] = false;
    //      // plyr.play('assets/khata.mp3');
    //       print('faux');
    //    // });
    //      },   
   // );


  }
  Widget _buildDragTarget(box) {
    return DragTarget<Box>(
      builder: (BuildContext context, List<Box> incoming, List rejected) 
      {
        // if (score[box] == true) {
        //   return Container(
        //      color: Colors.transparent,
        //   //  color: Colors.white,
        //     child: Text('صحيح',style: TextStyle(fontSize: 20),),
        //     alignment: Alignment.center,
        //     height: 80,
        //     width: 200,
        //   );
        // } else {
        //   return Container(
        //     color: choices[emoji], 
        //     height: 80,
        //      width: 200);
        // }
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        //setState(() {
         // score[emoji] = true;
        //  plyr.play('assets/a7sant.mp3');
          print('vrai');
        //});
      },
      onLeave: (data) {
        //setState(() {
          //score[emoji] = false;
         // plyr.play('assets/khata.mp3');
          print('faux');
        //});
      },
    );
  }
}
