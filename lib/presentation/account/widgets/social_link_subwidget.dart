import 'package:flutter/material.dart';

class SocailLinkSubWidget extends StatelessWidget {
  const SocailLinkSubWidget({
    Key? key,
    required this.instagramController,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;
  final TextEditingController instagramController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: width / 8,
            height: height / 9,
          ),
          SizedBox(
            width: width / 100,
          ),
          SizedBox(
            width: width / 1.25,
            height: height / 18,
            child: TextFormField(
              controller: instagramController,
              decoration: InputDecoration(
                hintText: text,
                // (usedata.bio == "" || usedata.bio == null)
                //     ? "Bio....."
                //     : usedata.bio,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
