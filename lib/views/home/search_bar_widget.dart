import 'package:flutter/material.dart';
import 'package:responsive_login_ui/constants.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  SearchBarWidget({Key? key})
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
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search your something",
          fillColor: Colors.white,
          filled: true,
          border: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
