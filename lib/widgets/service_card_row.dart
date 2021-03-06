import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweak/constants.dart';
import 'package:tweak/components/item_object.dart';
import 'package:tweak/widgets/service_card.dart';

class CardRow extends StatefulWidget {

  final List<ItemObject> cardRow;
  final String rowTitle;

  CardRow(this.cardRow,this.rowTitle);

  @override
  _CardRowState createState() => _CardRowState();
}

class _CardRowState extends State<CardRow> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //this gonna give us total height and with of our device
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15,),
          SizedBox(
            width: size.width*0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.rowTitle,
                  style: TextStyle(
                    fontFamily: 'HKGrotesk-Bold',
                    fontSize: 20,
                    color: kPrimaryColor,
                    height: 1,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontFamily: 'HKGrotesk-Medium',
                    fontSize: 14,
                    color: kGreenColor,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.cardRow.length,
              itemBuilder: (BuildContext context, int i) {
                return Transform.scale(
                  scale: 1,
                  child: ServiceCard(widget.cardRow[i].title,widget.cardRow[i].path),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}

