import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:newzapp/Helper/data.dart';
import 'package:newzapp/Helper/news.dart';
import 'package:newzapp/Models/article_model.dart';
import 'package:newzapp/Models/category_model.dart';
import 'package:newzapp/PageTransition_animation/transition_animations.dart';
import 'package:newzapp/category_news_page.dart';
import 'package:newzapp/designs/news_tile_design.dart';
import 'package:newzapp/searchednews_page.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final bool _validate = false;
  final TextEditingController _searchedNews = TextEditingController();

  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  List<ArticleModel> searchedarticles = <ArticleModel>[];

  // ignore: unused_field
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
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
            : GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        //Categories
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                              itemCount: categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryTile(
                                    categories[index].categoryName);
                              }),
                        ),

                        const SizedBox(height: 18),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 45,
                                    child: TextField(
                                      //controller
                                      controller: _searchedNews,
                                      decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                          filled: true,
                                          fillColor:
                                              Colors.grey.withOpacity(0.3),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                          hintText:
                                              'Search keywords (e.g. "crypto")',
                                          hintStyle: const TextStyle(
                                              fontFamily: 'Lato')),
                                      cursorColor: Colors.black,
                                      cursorHeight: 20,
                                    )),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: IconButton(
                                    onPressed: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus &&
                                          currentFocus.focusedChild != null) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      }
                                      //give result of searched news keyword
                                      String search = _searchedNews.text;
                                      if (search.isEmpty) {
                                        _validate
                                            ? 'Value Can\'t Be Empty'
                                            : null;
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchedNewsPage(
                                                      search: search,
                                                    )));
                                      }
                                    },
                                    tooltip: 'Search',
                                    color: Colors.white,
                                    splashRadius: 20,
                                    icon: const Icon(IconlyLight.search)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),

                        Text(
                          'top-headlines',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.9)),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //News
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: ListView.builder(
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
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

//CATEGORYTILE
class CategoryTile extends StatelessWidget {
  final String _categoryName;
  // ignore: use_key_in_widget_constructors
  const CategoryTile(this._categoryName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            VerticlePageTransition(
                widget:
                    CategoryNewsPage(category: _categoryName.toLowerCase())));
      },
      child: Container(
        height: 20,
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 9),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            _categoryName,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
        ),
      ),
    );
  }
}

//NEWSTILE

