import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/resources/color-manager.dart';
import 'package:ubenwa_challenge/resources/values-manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p16, left: AppPadding.p16, right: AppPadding.p16),
      child: Shimmer.fromColors(
        baseColor: ColorManager.colorShimmer,
        highlightColor: ColorManager.colorShimmer.withOpacity(0.2),
        child: Column(
          children: <int>[0, 1, 2, 3, 4, 5, 6, 7]
              .map((_) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
              child: Row(
                children: [
                  Container(
                    width: AppSize.s50,
                    height: AppSize.s50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: AppSize.s18,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Container(
                            width: 70,
                            height: 15.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),).toList(),
        ),
      ),
    );
  }
}

