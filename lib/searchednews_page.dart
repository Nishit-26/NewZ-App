import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newzapp/Helper/news.dart';
import 'package:newzapp/Models/article_model.dart';
import 'package:newzapp/designs/news_tile_design.dart';

// ignore: must_be_immutable
class SearchedNewsPage extends StatefulWidget {
  String search;
  SearchedNewsPage({Key? key, required this.search}) : super(key: key);

  @override
  _SearchedNewsPageState createState() => _SearchedNewsPageState();
}

class _SearchedNewsPageState extends State<SearchedNewsPage> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getSearchedNews();
  }

  getSearchedNews() async {
    SearchedNews newsClass = SearchedNews();
    await newsClass.getSearchedNews(widget.search);
    articles = newsClass.searchedNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "New",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  "Z",
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          body: _loading
              ? Center(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: CircularProgressIndicator(
                      color: Colors.blue.shade400,
                      strokeWidth: 4,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            height: 10,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " search result of :",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "'" + widget.search + "'",
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.8)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            height: 18,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return NewsTileDesign(
                                  articles[index].urlToImage,
                                  articles[index].title,
                                  articles[index].description,
                                  articles[index].articleUrl);
                            })
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
