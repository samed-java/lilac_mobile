import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lilac/constants/constants.dart';
import 'package:lilac/constants/text_styles.dart';

class EventsList extends StatefulWidget {
  EventsList({Key? key}) : super(key: key);

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: MediaQuery.of(context).size.width - 16,
              child: Text(
                "Events",
                style: verticalListTitleStyle,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * (318 / 375),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return listItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 16 : 10),
      width: MediaQuery.of(context).size.width * (285 / 375),
      height: MediaQuery.of(context).size.width * (328 / 375),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * (285 / 375),
            height: MediaQuery.of(context).size.width * (212 / 375),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*"),
                    fit: BoxFit.cover)),
          ),
          Container(
              margin: const EdgeInsets.only(top: 16.0),
              constraints: BoxConstraints(
                //maxHeight: MediaQuery.of(context).size.width * (50 / 375),
              ),
              //height: MediaQuery.of(context).size.width * (30 / 375),
              // child: FittedBox(
                  child: Text("Decorated the showcase of a fashion boutique",style: cardItemsTxtstyle,))
    //)
    ,
          Container(
              margin: const EdgeInsets.only(top: 16.0),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width * (50 / 375),
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: FittedBox(child: Text("20.02.21"))),
        ],
      ),

      //color: liliac_enable,
    );
  }
}
