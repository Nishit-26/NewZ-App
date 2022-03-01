import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newzapp/Helper/saved_article.dart';
import 'package:newzapp/Models/saved_article_model.dart';
import 'package:newzapp/PageTransition_animation/transition_animations.dart';
import 'package:newzapp/article_page.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  //we have to retrive data via list here
  List<SavedArticleModel> savedArticleList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getSaved();
  }

  getSaved() {
    SavedArticle savedArticleClass = SavedArticle();
    savedArticleList = savedArticleClass.getSavedArticle();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      'Saved Articles',
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
                    ListView.builder(
                        itemCount: savedArticleList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SavedArticleTile(
                              imageUrl: savedArticleList[index].imgUrl,
                              title: savedArticleList[index].title,
                              description: savedArticleList[index].description,
                              url: savedArticleList[index].articleUrl);
                        }),
                  ],
                ),
              ),
            ),
    ));
  }
}

//NEWSTILE
class SavedArticleTile extends StatefulWidget {
  final String imageUrl, title, description, url;
  // ignore: use_key_in_widget_constructors
  const SavedArticleTile(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.url});

  @override
  State<SavedArticleTile> createState() => _SavedArticleTileState();
}

class _SavedArticleTileState extends State<SavedArticleTile> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Card(
      shadowColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                widget.description,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Remove from saved",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        SidePageTransition(
                            widget: ArticlePage(articleUrl: widget.url)));
                  },
                  child: const Text(
                    'Read more',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blue.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
