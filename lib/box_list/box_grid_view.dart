import 'package:exercices/boxs.dart';
import 'package:flutter/material.dart';
import '../box_list/box_item.dart';

class BoxGrid extends StatefulWidget {
  const BoxGrid({Key key, this.box}) : super(key: key);
  final List<Box> box;

  @override
  _CardGridState createState() => _CardGridState();
}

class _CardGridState extends State<BoxGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     shrinkWrap: true,
      itemCount: widget.box.length,
      
     gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
       childAspectRatio: 160 / 200,
       
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      
      itemBuilder: (context, index) => BoxItem(
        box: widget.box[index],
      ),
    );
  }
}
