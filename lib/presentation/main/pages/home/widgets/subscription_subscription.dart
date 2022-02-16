import 'package:flutter/material.dart';
import 'package:lilac/constants/color_constants.dart';
import 'package:lilac/constants/text_styles.dart';

class Subscriprion extends StatefulWidget {
  const Subscriprion({Key? key}) : super(key: key);

  @override
  _SubscriprionState createState() => _SubscriprionState();
}

class _SubscriprionState extends State<Subscriprion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(

              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*"

          )
            ,fit:BoxFit.cover
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 24,left: 16),
            width: MediaQuery.of(context).size.width*(316/375),
            height: MediaQuery.of(context).size.width*(88/375),
           // alignment: Alignment.topLeft,
              child: Text(

                "Flower\nSubscription",
                textAlign: TextAlign.start,
                style: whiteTitleText,
              ),

          ),
          GestureDetector(
            onTap: (){},

            child: Container(
              margin: EdgeInsets.only(bottom:24 ,left: 16),
              width: MediaQuery.of(context).size.width*(125/375),
              height: MediaQuery.of(context).size.width*(48/375),
              decoration: BoxDecoration(
                color: liliac_enable,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Container(
                  child: FittedBox(
                    child : Text("SHOP NOW", style: whiteButtonText,)
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
