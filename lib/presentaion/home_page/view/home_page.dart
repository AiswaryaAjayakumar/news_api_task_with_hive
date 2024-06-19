// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_api/presentaion/detailed_news_screen/view/detailed_screen.dart';
import 'package:news_api/presentaion/home_page/controller/home_screen_controller.dart';
import 'package:news_api/presentaion/home_page/view/widgets/custon_news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchingData();
  }

  fetchingData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final providerObj = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Latest News")),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => CustomNewsCard(
                imageUrl: providerObj.newArticles[index].urlToImage ?? "",
                author: providerObj.newArticles[index].author ?? "",
                title: providerObj.newArticles[index].title ?? "",
                des: providerObj.newArticles[index].description ?? "",
                onDetailedTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedScreen(
                            details: providerObj.newArticles[index]),
                      ));
                },
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: providerObj.newArticles.length),
    );
  }
}
