//import 'package:ecommerce_app/pages/favourite_page.dart';
//import 'package:ecommerce_app/pages/home_page.dart';
//import 'package:ecommerce_app/pages/my_cart_page.dart';
//import 'package:ecommerce_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:store_shoes/pages/card.dart';
import 'package:store_shoes/pages/homepage.dart';

List sideMenuItems = [
      {
        "label": "صفحه اصلی",
        "selected": true,
        "icon": LineIcons.home,
        "page": HomePage()
      },
      {
        "label": "سبد خرید",
        "selected": false,
        "icon": LineIcons.shoppingCart,
        "page": CardPage()
      },
      {
        "label": "علاقمندی",
        "selected": false,
        "icon": LineIcons.heart,
       // "page": FavouritePage()
      },
      {
        "label": "سفارش من",
        "selected": false,
        "icon": LineIcons.history,
      //  "page": OrderPage()
      },
    ];