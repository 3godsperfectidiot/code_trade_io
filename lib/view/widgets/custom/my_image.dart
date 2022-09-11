import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  final BoxFit fit;

  const MyImage(
    this.imageUrl, {
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  CachedNetworkImage build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        progressIndicatorBuilder: (context, _, downloadProgress) => Center(
          child: CircularProgressIndicator.adaptive(
            value: downloadProgress.progress,
          ),
        ),
        errorWidget: (context, _, error) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error),
            SizedBox(height: 5),
            Text("Image Not Found."),
          ],
        ),
      );
}
