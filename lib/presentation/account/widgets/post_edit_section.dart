import 'package:flutter/material.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class PostDesEditingSection extends StatefulWidget {
  const PostDesEditingSection({
    Key? key,
    required this.postdata,
  }) : super(key: key);
  final PostModel postdata;

  @override
  State<PostDesEditingSection> createState() => _PostDesEditingSectionState();
}

class _PostDesEditingSectionState extends State<PostDesEditingSection> {
  TextEditingController desController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    desController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height / 1.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: desController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                maxLength: 1000,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: (widget.postdata.description == "" ||
                          widget.postdata.description == null)
                      ? "Description....."
                      : widget.postdata.description,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                height: height / 15,
                child: CurvedElevatedButton(
                    text: "Save",
                    background: appColor,
                    onpress: () async {
                      if (widget.postdata.description !=
                          desController.text.toString()) {
                        Map<String, dynamic> data = {
                          "postid": widget.postdata.id,
                          "description": desController.text.toString(),
                          "pastpost": ""
                        };
                        final res = await UserImplementation().editPost(data);
                        res.fold((l) {}, (r) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPageScreen()));
                        });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
