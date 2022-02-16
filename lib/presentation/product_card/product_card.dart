import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lilac/constants/color_constants.dart';
import 'package:lilac/constants/text_styles.dart';
import 'package:expandable/expandable.dart';
import 'package:lilac/presentation/product_card/widgets/image_view_dialog/ImageViewDialog.dart';
import 'package:lilac/presentation/product_card/widgets/recomended_products/recomended_products.dart';

class ProductCard extends StatefulWidget {
  List? itemlist;
  List? sizelist;
  List? taglist;

  ProductCard({Key? key, this.itemlist, this.sizelist, required this.taglist})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ValueNotifier<int> size = ValueNotifier(-1);
  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [buildContentMainBar(), buildDetails()]),
      ),
    );
  }

  Widget buildContentMainBar() {
    return Column(
      children: [
        //image carousel builder
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),
                  )
                  ),

                ),
              ),
              Container(child:
              CarouselSlider.builder(
                itemCount: widget.itemlist!.length,
                itemBuilder: (context, index, pageIndex) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ImageViewDialog(
                                items: widget.itemlist, selectedIndex: index);
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image.network(
                        widget.itemlist![index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width,
                  aspectRatio: 1,
                  viewportFraction: 1,
                  initialPage: 0,
                  reverse: true,
                  autoPlay: true,
                ),
              ),),
              GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.all(16),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,),
                      )
                  ),

                ),
              ),
              likeButton(size: 30)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 66,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 32,
                  child: FittedBox(
                    child: Text(
                      "Mary Virgina Martin",
                      style: productTitleTextSytle,
                    ),
                  )),
              Container(
                  constraints: BoxConstraints(maxHeight: 22),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: etiket_back),
                            child: Center(
                              child: Text(
                                "9%",
                                style: etiket_style,
                              ),
                            ),
                          ),
                          Container(
                            height: 22,
                            margin: EdgeInsets.only(left: 8),
                            child: FittedBox(
                              child: Text(
                                "68 AZN",
                                style: endirim_style,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 22,
                        margin: EdgeInsets.only(left: 8),
                        child: FittedBox(
                          child: Text(
                            "78 AZN",
                            style: old_cost,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: size,
                builder: (context, sizeIndex, child) {
                  return Container(
                      width: (MediaQuery.of(context).size.width * (144 / 375)) +
                          16,
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            widget.sizelist!.length,
                            (j) => GestureDetector(
                                  onTap: () {
                                    size.value = j;
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: j == 0 ? 0 : 8),
                                    child: sizeButton(
                                        size:
                                            (MediaQuery.of(context).size.width *
                                                        (152 / 375) -
                                                    16) /
                                                3,
                                        isSelected: size.value == j,
                                        sizeName: widget.sizelist![j]),
                                  ),
                                )),
                      ));
                },
              ),
              ValueListenableBuilder(
                  valueListenable: count,
                  builder: (context, inc, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width * (131 / 375),
                      height: MediaQuery.of(context).size.width * (48 / 375),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              count.value != 0
                                  ? count.value = count.value - 1
                                  : count.value = 0;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width *
                                  (48 / 375),
                              height: MediaQuery.of(context).size.width *
                                  (48 / 375),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: size_selected)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: circle_button_text_style,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height:
                                MediaQuery.of(context).size.width * (28 / 375),
                            child: FittedBox(
                              child: Text(
                                count.value.toString(),
                                style: circle_button_text_style,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              count.value = count.value + 1;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width *
                                  (48 / 375),
                              height: MediaQuery.of(context).size.width *
                                  (48 / 375),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: size_selected)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: circle_button_text_style,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (true) {}
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: liliac_enable, borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Container(
                    height: 30,
                    child: FittedBox(
                        child: Text(
                      "Add to card",
                      style: whiteButtonText,
                    )))),
          ),
        )
      ],
    );
  }

  Widget sizeButton(
      {required double size,
      required bool isSelected,
      required String sizeName}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !isSelected ? Colors.white : size_selected,
          border: Border.all(color: size_selected)),
      child: Center(
        child: Text(
          sizeName,
          style: circle_button_text_style,
        ),
      ),
    );
  }

  Widget buildDetails() {
    return Column(
      children: [
        ExpandableNotifier(
          child: ScrollOnExpand(
            child: ExpandablePanel(
                collapsed: Container(
                  color: comp_text_background,
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 30,
                        child: FittedBox(child: Text("COMPOSITION")),
                      ),
                      ExpandableButton(
                          child: Container(
                              margin: EdgeInsets.all(16),
                              child: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 30,
                              )))
                    ],
                  ),
                ),
                expanded: Container(
                  color: comp_text_background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: comp_text_background,
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(16),
                              height: 30,
                              child: FittedBox(child: Text("COMPOSITION")),
                            ),
                            ExpandableButton(
                                child: Container(
                                    margin: EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.keyboard_arrow_up_sharp,
                                      size: 30,
                                    )))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width,
                          color: comp_text_background,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                                widget.taglist!.length,
                                (i) => Container(
                                      height: 20,
                                      margin: EdgeInsets.only(right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: liliac_enable),
                                            width: 6,
                                            height: 6,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 7),
                                              child: Text(widget.taglist![i])),
                                        ],
                                      ),
                                    )),
                          )),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: size_selected))),
                        child: Text(
                            "We would like kindly ask you to consider seasonality of flowers in this order. Some flowers could be replaced with better options in the bouquet."),
                      )
                    ],
                  ),
                )),
          ),
        ),
        ExpandableNotifier(
            child: ScrollOnExpand(
          child: ExpandablePanel(
              collapsed: Container(
                color: comp_text_background,
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 30,
                      width: MediaQuery.of(context).size.width - 100,
                      child:
                          FittedBox(child: Text("HOW TO CARE FLOWERS AT HOME")),
                    ),
                    ExpandableButton(
                        child: Container(
                            margin: EdgeInsets.all(16),
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 30,
                            )))
                  ],
                ),
              ),
              expanded: Container(
                color: comp_text_background,
                child: Column(
                  children: [
                    Container(
                      color: comp_text_background,
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(16),
                            height: 30,
                            width: MediaQuery.of(context).size.width - 100,
                            child: FittedBox(
                                child: Text("HOW TO CARE FLOWERS AT HOME")),
                          ),
                          ExpandableButton(
                              child: Container(
                                  margin: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.keyboard_arrow_up_sharp,
                                    size: 30,
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: size_selected))),
                      child: Text(
                          "Here are some tips to help our flowers delight you for a long time: First of all, pour on cold water into the vase (more than half) If you have medicine for flowers, add the mixture to the water. Trim the flowers stems at an acute angle. The water in the vase should be changed every day, and the stems should be washed under running water and pruned regularly. Flowers should not be near heating devices, in a draft or in direct sunlight. Flower compositions with using a floral sponge should be watered once every two days to keep the sponge constantly moist."),
                    ),
                  ],
                ),
              )),
        )),
        RecomendedProducts()
      ],
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
                width: size + 32,
                height: size + 32,
                padding: EdgeInsets.all(16),
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
