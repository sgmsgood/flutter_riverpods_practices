import 'package:flutter/material.dart';
import 'package:flutter_restaurant_inflearn/common/view/root_tab.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.actions,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      bottomNavigationBar: bottomNavigationBar,
      body: child,
      // body: Padding(
      //   // padding: EdgeInsets.symmetric(horizontal: 8.0),
      //   child: child,
      // ),
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
        elevation: 0,
      );
    }
  }
}
