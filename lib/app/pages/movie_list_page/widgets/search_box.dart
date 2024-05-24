import 'package:flutter/material.dart';

import '../../../utils/translations/generated/l10n.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          border: Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
          ),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: Translation.of(context).search,
          ),
          onChanged: onChanged,
        ),
      );
}
