import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function()? onPressed;

  const CustomAppBar({
    Key? key,
    this.onPressed,
  })  : preferredSize = const Size.fromHeight(120.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
      title: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: searchBarColor,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                labelText: 'Enter something',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            color: searchBarColor,
            child: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      bottom: TabBar(
        labelColor: black,
        indicatorColor: Colors.red,
        tabs: const [
          Tab(text: 'News'),
          Tab(text: 'Home'),
          Tab(text: 'Popular'),
          Tab(text: 'Awarded'),
        ],
      ),
    );
  }
}
