import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LazyLoadImage extends StatefulWidget {
  final String? url;
  final double? errorSize;
  const LazyLoadImage({super.key, this.url, this.errorSize});

  @override
  State<LazyLoadImage> createState() => _LazyLoadImageState();
}

class _LazyLoadImageState extends State<LazyLoadImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: widget.errorSize,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                  image: AssetImage('assets/images/placeholder.png'),
                  fit: BoxFit.scaleDown,
                )),
            width: 50,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: SizedBox(
          width: widget.errorSize,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                  image: AssetImage('assets/images/placeholder.png'),
                  fit: BoxFit.scaleDown,
                )),
            width: 50,
          ),
        ),
      ),
    );
  }
}
