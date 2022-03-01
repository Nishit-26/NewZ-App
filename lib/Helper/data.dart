import 'package:newzapp/Models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];

  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel = CategoryModel();
  categoryModel.categoryName = "general";
  categories.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "business";
  categories.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "technology";
  categories.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "health";
  categories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "science";
  categories.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName = "sports";
  categories.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = "entertainment";
  categories.add(categoryModel);

  return categories;
}
