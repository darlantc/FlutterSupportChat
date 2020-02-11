import 'package:flutter/material.dart';

extension TextExtension on Text {
  Container withMargin({TextStyle style, EdgeInsets margin}) {
    EdgeInsets defaultMargin = EdgeInsets.only(top: 4, bottom: 8);
    return Container(
      margin: margin ?? defaultMargin,
      child: Text(
        this.data,
        style: style,
      ),
    );
  }

  Widget h1({TextStyle style, EdgeInsets margin}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.02,
    );
    return withMargin(
      style: (this.style ?? defaultStyle).merge(
        style ?? defaultStyle,
      ),
      margin: margin,
    );
  }

  Widget h2({TextStyle style, EdgeInsets margin}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.02,
    );

    return withMargin(
      style: (this.style ?? defaultStyle).merge(
        style ?? defaultStyle,
      ),
      margin: margin,
    );
  }
}
