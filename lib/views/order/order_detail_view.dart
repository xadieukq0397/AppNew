import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key, required this.pageId}) : super(key: key);
  final int pageId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GetBuilder<OrderController>(builder: (orderController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        width: 25,
                        height: 25,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.black,
                            size: 18,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.titleOrderDetail,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Text(
                                orderController.orders[pageId].statusOrder!,
                                style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 280,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.separated(
                    itemCount:
                        orderController.listValuesMapOrder[pageId]!.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                color: Color(0XFFF1F1F1),
                              ),
                              BoxShadow(
                                offset: Offset(0, -3),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                color: Color(0XFFF1F1F1),
                              ),
                              BoxShadow(
                                offset: Offset(3, 0),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                color: Color(0XFFF1F1F1),
                              ),
                              BoxShadow(
                                offset: Offset(-3, 0),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                color: Color(0XFFF1F1F1),
                              ),
                            ],
                          ),
                          height: 120,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 70),
                          margin: const EdgeInsets.only(
                              left: 60, top: 5, bottom: 5, right: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                orderController
                                    .listValuesMapOrder[pageId]![index]
                                    .productName!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.textQuantity}: ${orderController.listValuesMapOrder[pageId]![index].quantity}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${AppLocalizations.of(context)!.textPrice}: ${orderController.listValuesMapOrder[pageId]![index].unitPrice}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 20,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                child: Image.network(
                                  orderController
                                      .listValuesMapOrder[pageId]![index]
                                      .productImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      int index = 0;
                      orderController.changeColor(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 120,
                      decoration: BoxDecoration(
                        color: orderController.isChangeState
                            ? const Color(0XFFE5EAFC)
                            : const Color(0XFFFEF4E0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/credit-card.png",
                            fit: BoxFit.cover,
                            width: 22,
                            height: 22,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!.paymentTabbar,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      int index = 1;
                      orderController.changeColor(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 120,
                      decoration: BoxDecoration(
                        color: orderController.isChangeState
                            ? const Color(0XFFFEF4E0)
                            : const Color(0XFFE5EAFC),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/address.png",
                            fit: BoxFit.cover,
                            width: 22,
                            height: 22,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!.customerTabbar,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              orderController.isChangeState
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .customerName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      orderController
                                          .orders[pageId].customerName!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.phoneNumber,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      orderController
                                          .orders[pageId].phoneCustomer!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .addressCustomer,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Text(
                                      orderController
                                          .orders[pageId].addressCustomer!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.subTotalOrder}: ",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '${orderController.orders[pageId].totalPrice! - orderController.orders[pageId].transportFee!}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.transportFeeOrder}: ",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      orderController
                                          .orders[pageId].transportFee!
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.totalOrder}: ",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      orderController.orders[pageId].totalPrice!
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFFAC25),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.buttonPlaceOrder,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
