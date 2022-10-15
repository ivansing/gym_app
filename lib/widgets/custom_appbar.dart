import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Buscador Cercano',
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.message,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(Icons.person, color: Theme.of(context).primaryColor),
            onPressed: () {}),
      ],
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(56.0);
}