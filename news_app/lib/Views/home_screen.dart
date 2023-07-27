import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Views/article_view.dart';
import 'package:news_app/Views/category_news.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/newa.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
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
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
          :

          //Categories
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                categoryImageUrl:
                                    categories[index].imageUrl.toString(),
                                categoryName:
                                    categories[index].categoryName.toString());
                          }),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: articles.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: articles[index].urlToImage.toString(),
                                title: articles[index].title.toString(),
                                description:
                                    articles[index].description.toString(),
                                bUrl: articles[index].url.toString(),
                              );
                            }))
                  ],
                )),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryImageUrl, categoryName;
  CategoryTile({required this.categoryImageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(catUrl: categoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: categoryImageUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              )),
          Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )),
        ]),
      ),
    );
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
