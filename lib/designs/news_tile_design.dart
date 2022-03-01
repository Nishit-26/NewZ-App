import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newzapp/Helper/saved_article.dart';
import 'package:newzapp/PageTransition_animation/transition_animations.dart';
import 'package:newzapp/article_page.dart';

class NewsTileDesign extends StatefulWidget {
  final String imageUrl, title, description, url;
  // ignore: use_key_in_widget_constructors
  const NewsTileDesign(this.imageUrl, this.title, this.description, this.url);

  @override
  State<NewsTileDesign> createState() => _NewsTileDesignState();
}

class _NewsTileDesignState extends State<NewsTileDesign> {
  bool _saveStatus = false;

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
                  onPressed: () {
                    saveArticle(widget.imageUrl, widget.title,
                        widget.description, widget.url);
                    //  iterable_contains_unrelated_type
                    // ignore: iterable_contains_unrelated_type
                    setState(() {
                      _saveStatus = true;
                    });
                  },
                  child: Text(
                    _saveStatus ? "Saved" : "Save",
                    style: const TextStyle(
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
