import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/constants.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  SearchBarWidget({Key? key, required this.isReadOnly})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size screenSize =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 47,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screenSize.width * 0.7,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your something",
                    fillColor: Colors.white,
                    filled: true,
                    border: border,
                    focusedBorder: border,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
