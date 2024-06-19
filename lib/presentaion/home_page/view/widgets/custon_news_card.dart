// // ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, must_be_immutable, prefer_const_literals_to_create_immutables, unused_local_variable

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:news_api/presentaion/home_page/controller/home_screen_controller.dart';

// import 'package:provider/provider.dart';

// class customNewsCard extends StatelessWidget {
//   customNewsCard({
//     super.key,
//     required this.imageUrl,
//     required this.author,
//     required this.title,
//     this.des,
//     this.onDetailedTap,
//   });
//   String imageUrl;
//   String author;
//   String title;
//   String? des;

//   final void Function()? onDetailedTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onDetailedTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         width: MediaQuery.sizeOf(context).height,
//         child: Row(
//           children: [
//             CachedNetworkImage(
//               height: 200,
//               width: 140,
//               fit: BoxFit.cover,
//               imageUrl: imageUrl,
//               placeholder: (context, url) =>
//                   Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//             // ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(7),
//                       color: Color.fromARGB(255, 78, 167, 219),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Center(
//                         child: Text(title),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     des!,
//                     maxLines: 8,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     author,
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNewsCard extends StatelessWidget {
  CustomNewsCard({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    this.des,
    this.onDetailedTap,
  });

  final String imageUrl;
  final String author;
  final String title;
  final String? des;

  final void Function()? onDetailedTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetailedTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            CachedNetworkImage(
              height: 200,
              width: 140,
              fit: BoxFit.cover,
              imageUrl: imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150', // Provide a default image URL
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromARGB(255, 78, 167, 219),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(title.isNotEmpty ? title : 'No Title'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (des != null && des!.isNotEmpty)
                    Text(
                      des!,
                      maxLines: 8,
                    ),
                  if (des == null || des!.isEmpty)
                    Text(
                      'No Description Available',
                      maxLines: 8,
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    author.isNotEmpty ? author : 'Unknown Author',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

