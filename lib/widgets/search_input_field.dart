import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Material(
      color: themeData.colorScheme.secondary,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.search,
              size: 20,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration.collapsed(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9cabb8),
                    ),
                    fillColor: themeData.colorScheme.outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchAndToogle extends StatelessWidget {
  const SearchAndToogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchInputField(),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        )
      ],
    );
  }
}
