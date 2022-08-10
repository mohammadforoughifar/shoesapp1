import 'package:flutter/material.dart';
import 'package:store_shoes/json/constant.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animate_do/animate_do.dart';

class ProductDetail extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;

  const ProductDetail(this.name, this.img, this.price, this.rate, this.colors);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List sizes = [7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: getAppbar(),
        preferredSize: Size.fromHeight(60),
      ),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppbar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "جزیيات محصول",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: white,
              border: Border.all(color: primary.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: primary,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 19, right: 19, top: 10),
      child: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(
                color: primary, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(LineIcons.star),
              SizedBox(
                width: 8,
              ),
              Text(
                "${widget.rate} بازدید ",
                style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[600]),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "تومان ",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${widget.price} ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: secondary.withOpacity(0.2)),
                    //  shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: secondary.withOpacity(0.15),
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]),
                child: Icon(
                  LineIcons.heart,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: List.generate(widget.colors.length, (index) {
                        return FadeIn(
                          duration: Duration(milliseconds: 1000 * index),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: secondary.withOpacity(0.1),
                                          ),
                                          color: white),
                                    )),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(widget.colors[index]),
                                        fit: BoxFit.fill),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeIn(
                            duration: Duration(milliseconds: 1600),
                            child: Stack(
                              children: [
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(120),
                                      topLeft: Radius.circular(120),
                                      topRight: Radius.circular(40),
                                    ),
                                    color: secondary.withOpacity(0.12),
                                  ),
                                ),
                                Container(
                                  height: 270,
                                  child: Image.asset(widget.img,fit: BoxFit.cover,),
                                )
                              ],
                            ),
                          ),
                        )

                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: size.width*0.15,
                        child: Text('اندازه :')),
                    Flexible(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(sizes.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: secondary.withOpacity(0.9)
                                  ),
                                  child:Center(child: Text(sizes[index].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)) ,
                                ),
                              );

                            }),
                          ),
                        ),
                      ),
                    )

                  ],
                )
              ],
            ),

          )
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Row(
          children: [
            Text(
              "بیشتر",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              width: 150,
            ),
            Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  Text(
                    "1",
                    style: TextStyle(fontSize: 16, color: white),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: secondary.withOpacity(0.15),
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: GestureDetector(
                onTap: (){

                },
                child: Center(
                  child: Icon(
                    LineIcons.shoppingBag,
                    size: 23,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
