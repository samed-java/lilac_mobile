import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lilac/constants/color_constants.dart';
import 'package:lilac/constants/custom_icons.dart';
//import 'package:lilac/constants/custom_icons.dart';
import 'package:lilac/presentation/main/pages/home/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [Home(),Container(),Container(),Container(),Container()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        selectedItemColor:  liliac_enable,
        unselectedItemColor: liliac_disable,
        selectedIconTheme: IconThemeData(color: liliac_enable),
        unselectedIconTheme: IconThemeData(color: liliac_disable),

        onTap: (index){
          setState(() {
            currentIndex= index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home_icon.svg',color: currentIndex==0?liliac_enable:liliac_disable,),
            //label: "main"
            title: Text("Main",style: TextStyle(fontSize: 9,)
          ),
    ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/catalog_icon.svg',color: currentIndex==1?liliac_enable:liliac_disable,),
            //label: "catalog"
            title: Text("Catalog",style: TextStyle(fontSize: 9,)
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/card_icon.svg',color: currentIndex==2?liliac_enable:liliac_disable,),
            //label: "cart"
            title: Text("Cart",style: TextStyle(fontSize: 9,)
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/fav_icon.svg',color: currentIndex==3?liliac_enable:liliac_disable,),
            //label: "catalog"
            title: Text("Favorites",style: TextStyle(fontSize: 9,)
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            //label: "cart"
            title: Text("Account",style: TextStyle(fontSize: 9,)
            ),
          ),
        ],

      ),
      body: pages.elementAt(currentIndex),
    );
  }
}
