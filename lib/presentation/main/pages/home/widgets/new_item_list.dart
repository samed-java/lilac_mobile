import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lilac/constants/constants.dart';
import 'package:lilac/constants/text_styles.dart';

class NewItemList extends StatefulWidget {

  NewItemList({Key? key}) : super(key: key);

  @override
  _NewItemListState createState() => _NewItemListState();
}

class _NewItemListState extends State<NewItemList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 16,

              child: Text("New",style: verticalListTitleStyle,),
            ),
          ),
          Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width*(318/375),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return listItem(index);
              }
              ,
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Container(

      margin: EdgeInsets.only(left: index == 0?16:10),
      width: MediaQuery
          .of(context)
          .size
          .width * (266 / 375),
      height: MediaQuery
          .of(context)
          .size
          .width * (274 / 375),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * (266 / 375),
            height: MediaQuery
                .of(context)
                .size
                .width * (266 / 375),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*"



                    )
                    , fit: BoxFit.cover
                )

            ),

          ),
          Container(
            //margin: const EdgeInsets.only(top:16.0),
              constraints: BoxConstraints(

                maxHeight: MediaQuery
                    .of(context)
                    .size
                    .width * (30 / 375),
              ),
              child: FittedBox(child: Text("Rose"))),
          Container(
            //margin: const EdgeInsets.only(top:16.0),
              constraints: BoxConstraints(
                maxHeight: MediaQuery
                    .of(context)
                    .size
                    .width * (30 / 375),
              ),
              child: FittedBox(child: Text("80 AZN"))),
        ],
      ),

      //color: liliac_enable,
    );
  }
}
