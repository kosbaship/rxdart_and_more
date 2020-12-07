import 'package:first_blog_post/shared/colors/common_colors.dart';
import 'package:flutter/material.dart';

Widget defaultTextField(
        {@required String hint, @required TextEditingController controller}) =>
    TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint, hintStyle: TextStyle(color: kColorWhite)),
      style: TextStyle(color: kColorWhite),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
