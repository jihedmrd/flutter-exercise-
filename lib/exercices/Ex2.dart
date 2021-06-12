import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
class Ex2 extends StatefulWidget {
  Ex2({Key key}) : super(key: key);

  @override
  _Ex2State createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  /// Map to keep track of score
  final Map<String, bool> score = {};
  AudioPlayer plyr = AudioPlayer();
  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
    // 'assets/pencilCard.webp': 'pencil',
    // 'assets/radioCard.webp': 'radio',
    // 'assets/sunCard.webp': 'sun',
    // 'assets/schoolCard.webp': 'school',
    // 'assets/tigerCard.webp': 'tiger',
    // 'اصفر': Colors.yellow,
    // 'احمر': Colors.red,
    // 'بنفسجي': Colors.purple,
    // 'بني': Colors.brown,
    // 'برتقالي': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;
  int boxNumberIsDragged = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //     title: Text('Score ${score.length} / 6'),
      //     backgroundColor: Colors.pink),()
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
      Container(//background
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
               Text('أَضَعُ الْغِلاَلَ فِي مَكَانِهَا الْمُنَاسِبَ حَسَبَ لَوْنِهَا' ,
                    style: TextStyle(fontSize: 40),
                   )
            ],

            ) ,
            Container(
              child: Row(//proposition
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
        
                  children: 
                  choices.keys.map((emoji) {
                    if (score[emoji] != true) {
                      return Draggable<String>(
                      onDragStarted: () {

                      },
                      data: emoji,
                      child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                      feedback: Emoji(emoji: emoji),
                      childWhenDragging: Emoji(emoji: '🌱'),
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        height: 90,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "✅",
                          style: TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                      );
                    }
                    
                  })
                  .toList()),
            ),
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
             color: Colors.transparent,
          //  color: Colors.white,
            child: Text('صحيح',style: TextStyle(fontSize: 20),),
            alignment: Alignment.center,
            height: 80,
            width: MediaQuery.of(context).size.width / 7,
          );
        } else {
          return Container(
            color: choices[emoji], 
            height: 80,
             width: MediaQuery.of(context).size.width / 7);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          plyr.play('assets/a7sant.mp3');
          print('vrai');
        });
      },
      onLeave: (data) {setState(() {
          //score[emoji] = false;
          plyr.play('assets/khata.mp3');
          print('faux');
        });
      },
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

