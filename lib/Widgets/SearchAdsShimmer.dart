import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchAdsShimmer extends StatefulWidget {
  final String tag;
  final String timeSince;

  SearchAdsShimmer(this.tag, this.timeSince, {Key? key}) : super(key: key);

  @override
  State<SearchAdsShimmer> createState() => _SearchAdsShimmerState();
}

class _SearchAdsShimmerState extends State<SearchAdsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer(

          duration: Duration(seconds: 1),
          interval: Duration(milliseconds: 10),
          color: Colors.white,
          colorOpacity: 0.5,
          enabled: true,
          direction: ShimmerDirection.fromLTRB(),
          child: Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 8, top: 3, bottom: 3),
              child: Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.white, size: 14,),
                  Container(width: 3,),
                  Text(
                    widget.tag,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   right: 10,
        //   bottom: 10,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(6)),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 6, right: 8, top: 3, bottom: 3),
        //       child: Row(
        //         children: [
        //           Icon(Icons.alarm, color: Colors.grey, size: 14,),
        //           Container(width: 3,),
        //           Text(
        //             widget.timeSince,
        //             style: TextStyle(
        //               fontSize: 10,
        //               fontWeight: FontWeight.w900,
        //               color: Colors.grey.shade700,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
