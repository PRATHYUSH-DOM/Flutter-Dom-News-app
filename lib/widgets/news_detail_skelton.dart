import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NewsDetailSkelton extends StatelessWidget {
  const NewsDetailSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Container(
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
                for (var i = 0; i < 8; i++)
                  Container(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SkeletonItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: MediaQuery.of(context).size.width - 150,
                              height: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
