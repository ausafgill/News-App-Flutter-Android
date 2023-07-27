import 'package:flutter/material.dart';
import 'package:news_app/Views/home_screen.dart';
import 'package:news_app/helper/newa.dart';
import 'package:news_app/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String catUrl;
  CategoryNews({required this.catUrl});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> categoryList = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
  }

  getCategory() async {
    CategoryNewsClass newCategorynewsClass = CategoryNewsClass();
    await newCategorynewsClass.getCategory(widget.catUrl);
    categoryList = newCategorynewsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'News',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: categoryList.length,
                              itemBuilder: (context, index) {
                                return BlogTile(
                                    imageUrl: categoryList[index]
                                        .urlToImage
                                        .toString(),
                                    title: categoryList[index].title.toString(),
                                    description: categoryList[index]
                                        .description
                                        .toString(),
                                    bUrl: categoryList[index].url.toString());
                              })),
                    ],
                  ),
                ),
              ));
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, bUrl;
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.bUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ArticleView(blogUrl: bUrl))));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: NetworkImage(imageUrl))),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
