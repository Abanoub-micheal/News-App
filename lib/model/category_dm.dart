import 'dart:ui';

import 'package:news_application/my_theme.dart';

class CategoryDm {
  String id;
  String title;
  Color color;
  String image;

  CategoryDm({required this.id,required this.title,required this.image,required this.color});

   static List<CategoryDm> categoryList(){
     
     return[
       CategoryDm(id: 'sports', title: 'Sports', image:'assets/images/sports.png', color: MyTheme.redColor),
       CategoryDm(id: ' entertainment', title: ' Entertainment', image:'assets/images/entertainment.png', color: MyTheme.blueColor),
       CategoryDm(id: 'health', title: 'Health', image:'assets/images/health.png', color: MyTheme.pinkColor),
       CategoryDm(id: 'business', title: 'Business', image:'assets/images/business.png', color: MyTheme.brownColor),
       CategoryDm(id: 'science', title: 'Science', image:'assets/images/science.png', color: MyTheme.yellowColor),
       CategoryDm(id: ' technology', title: ' Technology', image:'assets/images/technology.png', color: MyTheme.blueColor),
     ];
   }




}