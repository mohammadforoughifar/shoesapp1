import 'package:flutter/material.dart';
import 'package:store_shoes/json/constant.dart';
import 'package:store_shoes/json/side_menu_json.dart';
import 'package:animate_do/animate_do.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [getHeader(), getBodyItem()],
      ),
    );
  }

  Widget getHeader() {
    return SizedBox(
      height: 160,
      child: DrawerHeader(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    color: secondary)),
            SizedBox(
              height: 10,
            ),
            Text(
              "سلام محمد فروغی فر خوش آمدید",
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Widget getBodyItem() {
    print(sideMenuItems.length);
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]['selected']) {
          print("Selected:" + sideMenuItems.length.toString());
          return FadeIn(
            duration: Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border: Border.all(color: secondary.withOpacity(0.05)),
                  boxShadow: [
                    BoxShadow(
                        color: secondary.withOpacity(0.03),
                        blurRadius: 2.5,
                        offset: Offset(0, 5))
                  ],
                ),
                child: ListTile(
                  onTap: () {},
                  minLeadingWidth: 10,
                  leading: Icon(
                    sideMenuItems[index]['icon'],
                    color: Colors.black,
                  ),
                  title: Text(
                    sideMenuItems[index]['label'],
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        }
        return FadeInLeft(
          duration: Duration(milliseconds: index * 400),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15, left: 20, right: 20),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: ListTile(
                onTap: () {
                 // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => sideMenuItems[index]['page']));
                },
                minLeadingWidth: 10,
                leading:
                    Icon(sideMenuItems[index]['icon'], color: Colors.black),
                title: Text(
                  sideMenuItems[index]['label'],
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
        );
        ;
      }),
    );
  }
}
