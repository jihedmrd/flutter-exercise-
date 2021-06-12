import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:audioplayers/audio_cache.dart';
class Ex3 extends StatefulWidget {
  Ex3({Key key}) : super(key: key);

  @override
  _Ex3State createState() => _Ex3State();
}

class _Ex3State extends State<Ex3> {
  /// Map to keep track of score
  final Map<String, bool> score = {};
  //AudioCache plyr = AudioCache();
  /// Choices for game
  final Map choices = {
    //   '🍏': Colors.green,
    // '🍋': Colors.yellow,
    // '🍅': Colors.red,
    // '🍇': Colors.purple,
    // '🥥': Colors.brown,
    // '🥕': Colors.orange
    'assets/te.jpg': 'pencil',
    'assets/radioCard.webp': 'radio',
    'assets/sunCard.webp': 'sun',
    'assets/schoolCard.webp': 'school',
    'assets/tigerCard.webp': 'tiger',
    // 'اصفر': Colors.yellow,
    // 'احمر': Colors.red,
    // 'بنفسجي': Colors.purple,
    // 'بني': Colors.brown,
    // 'برتقالي': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //     title: Text('Score ${score.length} / 6'),
      //     backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: 
      Container(
         decoration:   
         BoxDecoration(
          image: DecorationImage( 
            image: AssetImage("classroom.webp"),fit: BoxFit.cover, 
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), 
                    BlendMode.dstATop),),),
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Row(//question
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
               Text('أَبْحَثُ عَنْ الْكَلِمَةِ الَّتِي فِيهَا حَرْفُ  \'م\'  وَ أَضَعُهَا فِي الصُّنْدُوقِ الْمٌنَاسِبِ لَهَا' ,
                    style: TextStyle(fontSize: 40),
                   )
            ],

            ) ,
            Row(//proposition
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
        
                children: 
                
                choices.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                    feedback: Emoji(emoji: emoji),
                    childWhenDragging: Emoji(emoji: '🌱'),
                  );
                })
                .toList()),
            Row(//boxs
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                    ..shuffle(Random(seed)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Correct!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
         // return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
         // plyr.play('a7sant.mp3');
       
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 90,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
         style: TextStyle(color: Colors.pink, fontSize: 30),
        ),
      ),
    );
  }
}

