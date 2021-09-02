import 'package:flutter/material.dart';

class CustomPopMenu {
  final BuildContext context;
  final Offset? offset;
  CustomPopMenu({required this.context, required this.offset});

  void showPopupMenu() async {
    if (offset != null) {
      double left = offset!.dx;
      double top = offset!.dy;

      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(left, top, 100, 100),
        items: [
          PopupMenuItem(
            value: 1,
            child: Text("View"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 3,
            child: Text("Delete"),
          ),
        ],
        elevation: 8.0,
      ).then((value) {
        if (value != null) print(value);
      });
    } else {
      print('null offset');
    }
  }
}
