import 'package:flutter/material.dart';
import 'package:lilac/constants/assets.dart';
import 'package:lilac/constants/constants.dart';
import 'package:lilac/presentation/main/pages/home/widgets/compilation_list_item.dart';
import 'package:lilac/presentation/main/pages/home/widgets/events_list.dart';
import 'package:lilac/presentation/main/pages/home/widgets/new_item_list.dart';
import 'package:lilac/presentation/main/pages/home/widgets/subscription_subscription.dart';
import 'package:lilac/presentation/main/pages/home/widgets/bestseller_item_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarForHomePage(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Subscriprion(),
            BestsellerItemList(),
            CompilationItemList(),
            NewItemList(),
            EventsList()
          ],
        ),
      ),
    );
  }

 PreferredSize appBarForHomePage() {
    return PreferredSize(
        child: Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 48,
              width: 48,
              margin: EdgeInsets.only(right: 20,top:24),
              child: Center(child: Icon(Icons.search_outlined,size: 24,color: liliac_disable,)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:24),
            height: 48,
            child: Center(
              child: appbarTitle ,
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 48,
              width: 48,
              margin: EdgeInsets.only(left: 20,top:24),
              child: Center(child: Icon(Icons.location_on_outlined,size: 24,color: liliac_disable,)),
            ),
          )
        ],
      ),
    ),
        preferredSize: Size(MediaQuery.of(context).size.width,48));
 }
}
