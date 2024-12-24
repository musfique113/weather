import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/application/app_configuration/app_constant.dart';

class ReusableCachedImage extends StatelessWidget {
  const ReusableCachedImage({
    required this.imagePath,
    super.key,
    this.errorIcon,
    this.errorIconSize = 40.0,
    this.shape = BoxShape.rectangle,
    this.isFullPath = false,
    this.width,
    this.height,
    this.boxFit,
  });

  final String imagePath;
  final Widget? errorIcon;
  final double errorIconSize;
  final BoxShape shape;
  final bool isFullPath;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    // if (kDebugMode) {
    //   print(
    //     'Image url '
    //     '${isFullPath ? imagePath : imageUrl + imagePath}',
    //   );
    // }
    return CachedNetworkImage(
      imageUrl: isFullPath ? imagePath : imageUrl + imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? 50,
        width: width ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: shape,
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      ),
      errorListener: (error) {
        // debugPrint('Image failed to load: $error');
      },
      placeholder: (_, __) => _errorWidget(),
      errorWidget: (_, __, ___) => _errorWidget(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: errorIcon ?? const Icon(Icons.foggy),
    );
  }
}
