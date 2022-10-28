import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "Order Detail",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 360,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 70),
                      margin: const EdgeInsets.only(left: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Special Pan Pizza",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Quantity: 2",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Price: 300000",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 10,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            child: Image.asset(
                              "assets/avatar.png",
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
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Order Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "SubTotal: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "100000",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Transport fee: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "50000",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "150000",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Divider(thickness: 1.5),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Custom's Name: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Thanh Long",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Phone Number: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "0372141736",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Address: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Xóm 9, Xuân Hồng, Thành Phố Nam Định, Nam Định",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
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
        ],
      ),
    );
  }
}
