import 'package:newzapp/Models/saved_article_model.dart';

class SavedArticle {
  List<SavedArticleModel> getSavedArticle() {
    return articlesaved;
  }
}

List<SavedArticleModel> articlesaved = <SavedArticleModel>[];
saveArticle(
    String imgUrl, String title, String description, String articleUrl) {
  SavedArticleModel savedArticleModel = SavedArticleModel(
      imgUrl: imgUrl,
      title: title,
      description: description,
      articleUrl: articleUrl);
}
