// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:lobopunk/core/color.dart';
// import 'package:video_compress/video_compress.dart';

// class CompressProgress extends StatefulWidget {
//   const CompressProgress({super.key});

//   @override
//   State<CompressProgress> createState() => _CompressProgressState();
// }

// class _CompressProgressState extends State<CompressProgress> {
//   late Subscription subscription;
//   double? progress;

//   @override
//   void initState() {
//     super.initState();

//     subscription = VideoCompress.compressProgress$
//         .subscribe((progress) => setState(() => this.progress = progress));
//   }

//   @override
//   void dispose() {
//     VideoCompress.cancelCompression();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final value = progress == null ? progress : progress! / 100;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         LinearProgressIndicator(
//           value: value,
//           minHeight: 10,
//           color: appColor,
//           backgroundColor: const Color.fromARGB(255, 227, 225, 225),
//         ),
//       ],
//     );
//   }
// }
