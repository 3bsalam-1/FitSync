import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import 'skeleton_container_loading.dart';

class CustomImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double iconSize;
  final Color errorColor;

  const CustomImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
    required this.iconSize,
    required this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => SkeletonContainerLoading(
        height: height,
        width: width,
        child: Icon(
          Icons.photo,
          size: iconSize,
          color: gray10,
        ),
      ),
    );
  }
}
