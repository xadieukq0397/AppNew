import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:responsive_login_ui/config/ui_constants.dart';
import 'package:responsive_login_ui/controller/orders_history_controller.dart';

class OrdersHistory extends StatelessWidget {
  const OrdersHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Orders",
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<OrdersHistoryController>(
          builder: (orderViewController) => Container(
            height: Get.size.height,
            child: Column(children: [
              TabBar(
                controller: orderViewController.controller,
                unselectedLabelColor: Colors.amber,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: orderViewController.myTabs[0],
                  ),
                  Tab(
                    text: orderViewController.myTabs[1],
                  ),
                  Tab(
                    text: orderViewController.myTabs[2],
                  ),
                  Tab(
                    text: orderViewController.myTabs[3],
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: orderViewController.controller,
                    children: [
                      Column(children: [
                        Container(
                          height: 100,
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Customer Vũ Duy Huy',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize:
                                                  kProductStyle(size * 1.7)
                                                      .fontSize,
                                              color: Colors.black87),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            intl.DateFormat(
                                                    'dd-MM-yyyy kk:mm:ss ')
                                                .format(
                                              DateTime.now(),
                                            ),
                                            style: TextStyle(
                                                fontSize:
                                                    kProductStyle(size * 1.5)
                                                        .fontSize,
                                                color: Colors.grey)),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('6 products',
                                                style: TextStyle(
                                                    fontSize: kProductStyle(
                                                            size * 1.7)
                                                        .fontSize,
                                                    color: Colors.black87)),
                                            Text('Total price order 125000',
                                                style: TextStyle(
                                                    fontSize: kProductStyle(
                                                            size * 1.7)
                                                        .fontSize,
                                                    color: Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                      Text(
                        orderViewController.myTabs[1],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        orderViewController.myTabs[2],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        orderViewController.myTabs[3],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
