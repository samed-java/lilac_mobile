import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImageViewDialog extends StatefulWidget {
  List? items;
  int? selectedIndex;
  ImageViewDialog({Key? key, required this.items, required this.selectedIndex}) : super(key: key);

  @override
  _ImageViewDialogState createState() => _ImageViewDialogState();
}

class _ImageViewDialogState extends State<ImageViewDialog> {
  @override
  Widget build(BuildContext context) {
     return  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Stack(
            children: [
              Center(

                  child: CarouselSlider.builder(
                    itemCount: widget.items!.length,

                    itemBuilder: (context,index,widgetIndex)=>
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,

                        child: PinchZoom(
                          child: Image.network(
                            widget.items![index],
                            fit: BoxFit.contain,
                          ),
                          maxScale: 5,


                        ),


                    ),
                    options: CarouselOptions(
                      aspectRatio: MediaQuery.of(context).size.width/
                           MediaQuery.of(context).size.height,
                      viewportFraction: 1,
                      initialPage: widget.selectedIndex!,


                    )
                    ,
                  ),
                ),

              Align(
                alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                  child:Container(
                    margin: EdgeInsets.all(16),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: SvgPicture.asset("assets/icons/cancel_icon.svg",
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                  )
              )
            ],
          ),


     );
  }
}
