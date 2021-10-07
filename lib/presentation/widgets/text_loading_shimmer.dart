// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class TextLoadingShimmer extends StatelessWidget {
  List<Widget> _getLine() => <Widget>[
        Container(
          width: double.infinity,
          height: 8.0,
          color: AppColors.whiteColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ..._getLine(),
                    ..._getLine(),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
