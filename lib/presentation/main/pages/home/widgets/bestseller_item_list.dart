import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lilac/constants/constants.dart';
import 'package:lilac/constants/custom_icons.dart';
import 'package:lilac/constants/text_styles.dart';
import 'package:lilac/presentation/product_card/product_card.dart';

class BestsellerItemList extends StatefulWidget {
  BestsellerItemList({Key? key}) : super(key: key);

  @override
  _BestsellerItemListState createState() => _BestsellerItemListState();
}

class _BestsellerItemListState extends State<BestsellerItemList> {
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
                "Bestsellers",
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCard(
                      itemlist: [
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*",
                        "https://media.timeout.com/images/105645687/image.jpg",
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*",
                        "https://media.timeout.com/images/105645687/image.jpg",
                        "https://media.timeout.com/images/105645687/image.jpg",
                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*"
                      ],
                      sizelist: ['S', 'M', 'L'],
                      taglist: [
                        'Rose',
                        'Hrizantema',
                        'Lily',
                        'Asklepsis',
                        'Diantus',
                        'Eustoma'
                      ],
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 10),
        width: MediaQuery.of(context).size.width * (266 / 375),
        height: MediaQuery.of(context).size.width * (274 / 375),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * (266 / 375),
                height: MediaQuery.of(context).size.width * (266 / 375),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mothers-day-flower-bouquet-1588610191.jpg?crop=1.00xw:0.892xh;0,0.108xh&resize=1200:*"),
                      fit: BoxFit.cover),
                ),
                child: likeButton(size: 30)),
            Container(
                //margin: const EdgeInsets.only(top:16.0),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * (30 / 375),
                ),
                child: FittedBox(child: Text("Rose"))),
            Container(
                //margin: const EdgeInsets.only(top:16.0),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * (30 / 375),
                ),
                child: FittedBox(child: Text("80 AZN"))),
          ],
        ),

        //color: liliac_enable,
      ),
    );
  }

  Widget likeButton({required double size}) {
    ValueNotifier<bool> isLiked = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: isLiked,
        builder: (context, value, child) {
          return GestureDetector(
            onTap: ()=>isLiked.value=!isLiked.value,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: size + 20,
                height: size + 20,
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Center(
                        child: SvgPicture.asset(
                      'assets/icons/like_disable.svg',
                      width: size - 8,
                      height: size,
                      color: Colors.white,
                    )),
                    if (isLiked.value)
                      Center(
                          child: SvgPicture.asset(
                        'assets/icons/like_enable.svg',
                        width: size - 8,
                        height: size - 6,
                        color: liliac_enable,
                      )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
