import 'package:flutter/material.dart';
import '../Cards.dart';
import '../boxs.dart';
import '../card_list/card_grid_view.dart';
import '../box_list/box_grid_view.dart';
class Ex1 extends StatefulWidget {
  Ex1({Key key}) : super(key: key);

  @override
  _Ex1State createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  // String productDropped = 'ابحث عن الكلمة التي فيها حرف م واضعها في الصندوق المناسب';
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(//background
           decoration:   
         BoxDecoration(
          image: DecorationImage( 
            image: AssetImage("classroom.webp"),fit: BoxFit.cover, 
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), 
                    BlendMode.dstATop),),),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
           // Container(
             // margin: EdgeInsets.all(90),
              //child:
               Row(//question
              mainAxisAlignment: MainAxisAlignment.center,
           
              children: [
                 Text('أَبْحَثُ عَنْ الْكَلِمَةِ الَّتِي فِيهَا حَرْفُ  \'م\'  وَ أَضَعُهَا فِي الصُّنْدُوقِ الْمٌنَاسِبِ لَهَا' ,
                      style: TextStyle(fontSize: 40),
                     )
              ],

              ),
           // ) ,
            Container(
              child: Row(//propositions
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)
                    ),
                   //  margin: EdgeInsets.all(0.3),
                    width: MediaQuery.of(context).size.width * .80,
                    height: MediaQuery.of(context).size.height / 3,
                    //padding: const EdgeInsets.all(50),
                    child: CardGrid(  
                      cards: Card0.list,
                    ),
                  ),
                ]
              ),
            ),

                  Container(
                    
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)),
                    width: MediaQuery.of(context).size.width * .80,
                    height: MediaQuery.of(context).size.height /3,  
                    child: Row(//boxs

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                               // margin: EdgeInsets.all(50),
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children:[_cardDragTarget1],
                                   ),
                               ),
                                Container(
                               // margin: EdgeInsets.all(50),
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children:[_cardDragTarget2],
                                   ),
                               ),
                                  Container(
                               // margin: EdgeInsets.all(50),
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children:[_cardDragTarget3],
                                   ),
                               ),
                                  Container(
                               // margin: EdgeInsets.all(50),
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children:[_cardDragTarget4],
                                   ),
                               ),
                              ],           
                    ),
                  ),
             ],
        ),
      ),
       
    );
  }

Widget get _cardDragTarget1{
    return DragTarget<Card0>(
      builder: (context, candidateData, rejectedData) {
        return  Center(
          child:Image.asset('maEnd.webp',height: 150,width: 150,),
        );
      },
      onWillAccept: (data) => true,
        // if(Card0.name =='pencil')
        //  { data ==true,}
        // else{data== false,}
        
      onAccept: (data) {
      //  setState(() => productDropped = data.name);
      },
      onLeave:(data)=>{print("be carefull!!")},
    );
  }
Widget get _cardDragTarget2 {
    return DragTarget<Card0>(
      builder: (context, candidateData, rejectedData) {
        return  Center(
           child:Image.asset('maMiddle.webp',height: 150,width: 150,),
          // Text(
          //   'Drag and Drop2',
          //   style: TextStyle(
          //     color: Colors.grey,
          //     fontSize: 16,
          //   ),
          // ),
        );
      },
      onWillAccept: 
      //test!!!
      (data) => true,
      onAccept: (data) {print("good!");
      //  setState(() => productDropped = data.name);
      },
    );
  }
  Widget get _cardDragTarget3 {
    return DragTarget<Card0>(
      builder: (context, candidateData, rejectedData) {
        return  Center(
          child:Image.asset('maMiddleToEnd.webp',height: 150,width: 150,),
        );
      },
      onWillAccept: (data) => false,
      onAccept: (data) {
      //  setState(() => productDropped = data.name);
      },
      onLeave:(data)=>{print("be carefull!!")},
    );
  }
  
Widget get _cardDragTarget4{
    return DragTarget<Card0>(
      builder: (context, candidateData, rejectedData) {
        return  Center(
          child:Image.asset('maStart.webp',height: 150,width: 150,),
        );
      },
      onWillAccept: (data) => false,
      onAccept: (data) {
      //  setState(() => productDropped = data.name);
      },
      onLeave:(data)=>{print("be carefull!!")},
    );
  }
}