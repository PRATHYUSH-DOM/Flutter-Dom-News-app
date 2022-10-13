import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(color: Colors.white),
                child: SkeletonItem(
                  child: Column(
                    children: const [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
