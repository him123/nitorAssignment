import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              width: 200.0,
              height: 20.0,
              color: Colors.red,
            ),
            period: Duration(milliseconds: 800),
          ),
          SizedBox(
            height: 10.0,
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              width: 200.0,
              height: 20.0,
              color: Colors.red,
            ),
            period: Duration(milliseconds: 800),
          ),
          SizedBox(
            height: 10.0,
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              width: 200.0,
              height: 20.0,
              color: Colors.red,
            ),
            period: Duration(milliseconds: 800),
          ),
          SizedBox(
            height: 10.0,
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              width: 200.0,
              height: 20.0,
              color: Colors.red,
            ),
            period: Duration(milliseconds: 800),
          ),
        ],
      ),
    );
  }
}
