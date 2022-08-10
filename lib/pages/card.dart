import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:store_shoes/json/constant.dart';
import 'package:store_shoes/json/my_cart_json.dart';
import 'package:animate_do/animate_do.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _State();
}

class _State extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: PreferredSize(
        child: getAppBare(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBare() {
    return AppBar(
      backgroundColor: secondary,
      centerTitle: true,
      title: Text(
        "سبد خرید",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(50),
              color: white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 5, offset: Offset(0, 5))
              ]),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 5, offset: Offset(0, 5))
                ]),
            child: Center(
              child: Icon(
                LineIcons.shoppingBag,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            color: primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          'ادامه خرید',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(children: [getCardList(), getPrompt()]),
    );
  }

  Widget getCardList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(myCartJson.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25, top: 25),
          child: FadeIn(
            duration: Duration(milliseconds: 1000 * index),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    myCartJson[index]['image'],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                            top: 10,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                myCartJson[index]['name'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  تومان  ',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              ),
                              Text(
                                myCartJson[index]['price'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.black.withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(
                                    LineIcons.minus,
                                    size: 13,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.black.withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(
                                    LineIcons.plus,
                                    size: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getPrompt() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 30, right: 10, left: 10),
      child: Row(
        children: [
          Container(
            width: (size.width - 20),
            height: 55,
            decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: (size.width-30)*0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          //labelText: 'کد تخفیف',
                          hintText: ' کد تخفیف',
border: InputBorder.none,
                      disabledBorder:OutlineInputBorder(
                       borderSide: BorderSide.none
                      ),
                    ),
                  )
                  ),
                ),
               Flexible(
                 child: Padding(
                   padding: const EdgeInsets.only(right: 3.0),
                   child: Container(
                     width: (size.width)*0.2,
                     height:50 ,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       color: primary.withOpacity(0.4)
                     ),
                     child: Center(child: Text('اعمال',style: TextStyle(color: white,fontSize: 18),)),
                   ),
                 ),
               )
              ],
            ),
          ),
          Flexible(child: Container())
        ],
      ),
    );
  }
}
