import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PublicPostWidget extends StatelessWidget {
  final String url;
  const PublicPostWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width / 180),
      child: Container(
        width: width / 3,
        height: height / 6,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(1)),
        child: (url == "")
            ? Container()
            : Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return (loadingProgress == null)
                      ? child
                      : const Center(child: CircularProgressIndicator());
                },
                errorBuilder: ((context, error, stackTrace) =>
                    const Icon(Icons.error)),
              ),
      ),
    );
  }
}
