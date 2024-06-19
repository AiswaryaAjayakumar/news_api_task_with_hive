// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/presentaion/favourite_screen/view/favourite_screen.dart';
import 'package:news_api/presentaion/home_page/controller/home_screen_controller.dart';
import 'package:news_api/repository/model/api_res_model.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({super.key, required this.details});

  final Article details;

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Details"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.justify,
                widget.details.title ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () {
                    HomeScreenController().addFav(
                        title: widget.details.title ?? "No title",
                        imgUrl: widget.details.urlToImage ?? "",
                        author: widget.details.author ?? "Unknown author");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouriteScreen(),
                        ));
                  },
                  icon: Icon(Icons.favorite_border_outlined)),
              SizedBox(
                height: 10,
              ),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.details.urlToImage ?? "",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(
                height: 25,
              ),
              Text(widget.details.description ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 25,
              ),
              Text(
                widget.details.author ?? "",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                widget.details.content ?? "",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
