import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_login_ui/data/provider/db/product_database.dart';
import 'package:responsive_login_ui/views/home/search_bar_widget.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ProductDataBase productDataBase = new ProductDataBase();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 5, bottom: 10, top: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white12,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              lImgProduct[index],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    lNameProduct[index],
                                    textDirection: TextDirection.ltr,
                                    style: kProductStyle(size),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.05),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lPriceProduct[index].toString(),
                                      style: TextStyle(
                                          fontSize:
                                              kProductStyle(size).fontSize,
                                          color: Colors.red),
                                    ),
                                    Text(saledName + lSaledProduct[index],
                                        style: TextStyle(
                                            fontSize:
                                                kProductStyle(size).fontSize,
                                            color: Colors.grey))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
      bottomNavigationBar: const DefaultTabController(
        length: 4,
        child: TabBar(tabs: [
          Tab(
            child: Icon(
              Icons.home_outlined,
              color: activeCyanColor,
            ),
          ),
          Tab(
            child: Icon(
              Icons.account_circle_outlined,
              color: activeCyanColor,
            ),
          ),
          Tab(
            child: Icon(
              Icons.shopping_cart_outlined,
              color: activeCyanColor,
            ),
          ),
          Tab(
            child: Icon(
              Icons.menu_outlined,
              color: activeCyanColor,
            ),
          )
        ]),
      ),
    );
  }
}
