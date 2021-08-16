
import 'package:wallpaper_app/models/categorie_model.dart';

String apiKEY = "563492ad6f917000010000019485138a517643fd9e78df35ca592b71";

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = [];
  CategorieModel categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Street Art";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "City";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.categorieName = "Motivation";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Bikes";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Cars";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();


  categorieModel.imgUrl =
  "https://images.pexels.com/photos/355288/pexels-photo-355288.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Wave";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Space";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
  "https://images.pexels.com/photos/220634/pexels-photo-220634.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Textures";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1389460/pexels-photo-1389460.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Curated";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
  "https://images.pexels.com/photos/3848886/pexels-photo-3848886.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Popular";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
  "https://images.pexels.com/photos/3169299/pexels-photo-3169299.jpeg?auto=compress&cs=tinysrgb&dpr=1&h=650&w=500";
  categorieModel.categorieName = "Abstract";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();



  return categories;
}