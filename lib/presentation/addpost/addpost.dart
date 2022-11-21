import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/application/addpost/addpost_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/presentation/addpost/post_upload.dart';
import 'package:lobopunk/widgets/chipwidget.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/paratextfeild.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = '/addpost-screen';
  final File file;
  const AddPostScreen({super.key, required this.file});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController desController = TextEditingController();
  TextEditingController hashtagController = TextEditingController();
  bool highvalue = true;
  bool guideline = false;
  List hashtags = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "New Post",
            style: TextStyle(fontSize: width / 20, fontWeight: FontWeight.w700),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 25),
          child: Column(
            children: [
              Container(
                height: height / 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (() {
                        setState(() {
                          guideline = guideline ? false : true;
                        });
                      }),
                      child: CircleAvatar(
                        backgroundColor: guideline
                            ? const Color.fromARGB(255, 112, 255, 117)
                            : Colors.grey,
                        radius: width / 23,
                      ),
                    ),
                    Text(
                      "Please accept guideline",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: width / 22),
                    )
                  ],
                ),
              ),
              const MySizedBox70(),
              Container(
                width: width / 3,
                height: height / 4,
                color: Colors.grey,
              ),
              const MySizedBox70(),
              ParaTextField(
                  controller: desController, hinttext: "Write your caption..."),
              Visibility(
                  visible: (hashtags.isNotEmpty),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                      ),
                      itemCount: hashtags.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: height / 80,
                          child: ChipWidget(
                              label: hashtags[index],
                              color: appColor,
                              cancel: () {
                                setState(() {
                                  hashtags.remove(hashtags[index]);
                                });
                              }),
                        );
                      })),
              TextFormField(
                controller: hashtagController,
                style: const TextStyle(color: Colors.white),
                inputFormatters: [
                  // is able to enter lowercase letters
                  FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                ],
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey.shade400),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: appColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: appColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: appColor),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hashtags.add(
                              hashtagController.text.toString().toLowerCase());
                          hashtagController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: width / 12,
                        color: Colors.grey,
                      )),
                  // border: OutlineInputBorder(),
                  hintText: 'HashTags',
                ),
              ),
              const MySizedBox70(),
              Row(
                children: [
                  Text(
                    "Upload at high quality",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: width / 22),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    value: highvalue,
                    onChanged: (value) {
                      setState(() {
                        highvalue = value;
                      });
                    },
                  ),
                ],
              ),
              const MySizedBox(),
              Center(
                child: SizedBox(
                  height: height / 18,
                  width: width / 1.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map data = {
                        "description": desController.text.toString(),
                        "hashtags": hashtags,
                      };
                      if (guideline) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostUploadScreen(
                                    data: data, file: widget.file)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please accept guidelines')));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(appColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          fontSize: width / 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
