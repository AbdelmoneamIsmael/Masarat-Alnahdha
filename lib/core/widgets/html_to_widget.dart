// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

// class HtmlToWidget extends StatelessWidget {
//   const HtmlToWidget({
//     super.key,
//     required this.data,
//   });

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     return Html(
//       data:
//           """
//                       $data
//     """,
//       extensions: [
//         TagExtension(
//           tagsToExtend: {"flutter"},
//           child: const FlutterLogo(),
//         ),
//       ],
//       style: {
//         "p.fancy": Style(
//           textAlign: TextAlign.center,
//           padding: HtmlPaddings.all(16.0),
//           backgroundColor: Colors.grey,
//           margin: Margins(
//             left: Margin(50, Unit.px),
//             right: Margin.auto(),
//           ),
//           width: Width(300, Unit.px),
//           fontWeight: FontWeight.bold,
//         ),
//       },
//     );
//   }
// }
