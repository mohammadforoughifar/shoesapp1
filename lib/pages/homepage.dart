import 'package:flutter/material.dart';
import 'package:store_shoes/pages/product_detail.dart';
import 'package:store_shoes/pages/side_menu.dart';
import 'package:store_shoes/thems/colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:store_shoes/json/ads_json.dart';
import 'package:store_shoes/json/home_json.dart';

//import 'package:store_shoes/pages/product_detail_page.dart';
//import 'package:ecommerce_app/pages/side_menu_page.dart';

import 'package:store_shoes/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scafoldkey=GlobalKey<ScaffoldState>();

  set img(img) {}
  set price(img) {}
  set name(img) {}
  set rate(img) {}
  set colors(name) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldkey,
      drawer: SideMenu(),
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      // bottomNavigationBar: getBottomNavigationBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text("فروشگاه فروغ آریا",
          style: TextStyle(
            color: Colors.red,
          ),
          textAlign: TextAlign.center),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          AntDesign.menuunfold,
          color: secondary,
        ),
        onPressed: () {
          scafoldkey.currentState?.openDrawer();
        },
      ),
      elevation: 0,
      backgroundColor: primary,
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.5))),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  color: secondary),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          CustomSlider(items: adsJson),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "دسته بندی ها",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          getCategory(),
          SizedBox(
            height: 25,
          ),
          GetItemInMainForm()
        ],
      ),
    );
  }

  Widget getCategory() {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    int pageIndex = 0;
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            width: (size.width) * 0.9,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categoryItems.length, (index) {
                  return Container(
                    height: 30,
                    decoration: pageIndex == index
                        ? BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                            color: secondary,
                            width: 1.5,
                          )))
                        : BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                        child: Text(categoryItems[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: pageIndex == index
                                    ? secondary
                                    : secondary.withOpacity(0.5))),
                      ),
                    ),
                  );
                }),
              ),
            )),
        // Container(
        //   width: 50,
        //
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
        //   child: Text("جستجو"),
        // )
      ],
    );
  }

  Widget GetItemInMainForm() {
    var size = MediaQuery.of(context).size;
    return Wrap(
        spacing: 5,
        runSpacing: 10,
        children: List.generate(homeJson.length, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail(
                    name=homeJson[index]['name'],
                    img=homeJson[index]['image'],
                    price=homeJson[index]['price'],
                    rate=homeJson[index]['rate'],
                    colors=homeJson[index]['colors'],

                  )));
                },
                child: FadeIn(
                  duration: Duration(milliseconds: 1000 * index),
                  child: Container(
                    height: 220,
                    child: Stack(children: [
                      Positioned(
                        child: Container(
                          width: (size.width - 50) / 2,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: secondary.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 15, right: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.star,
                                      size: 18,
                                      color: secondary,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(homeJson[index]['rate'])
                                  ],
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(50),
                                      shape: BoxShape.circle,
                                      color: white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: secondary.withOpacity(0.15),
                                            blurRadius: 5,
                                            offset: Offset(0, 5))
                                      ]),
                                  child: Icon(LineIcons.shoppingBag),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        child: Container(
                          width: (size.width - 50) / 2,
                          height: 180,
                          decoration: BoxDecoration(),
                          child: Image.asset(homeJson[index]['image']),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Text(
                homeJson[index]['name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(homeJson[index]['price'] + " تومان ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,)
            ],
          );
        }));
  }
}
