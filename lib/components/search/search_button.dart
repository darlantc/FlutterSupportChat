import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchButton extends StatelessWidget {
  final bool isSearching;
  final Function toggleIsSearching;

  const SearchButton({
    Key key,
    this.isSearching,
    this.toggleIsSearching,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => IconButton(
        icon: Icon(
          this.isSearching ? Icons.close : Icons.search,
        ),
        onPressed: this.toggleIsSearching,
      ),
    );
  }
}
