import 'package:flutter/material.dart';
import 'package:news_application/model/category_dm.dart';

class CategoryItem extends StatelessWidget {
 final CategoryDm category;
 final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft: Radius.circular(index.isEven ? 0 : 15),
              bottomRight: Radius.circular(index.isOdd ? 0 : 15))),
      child: Column(
        children: [

          Image.asset(category.image,width:double.infinity ,height:100 ,),
          const SizedBox(height: 10,),
          Text(category.title,style: const TextStyle(color: Colors.white,fontSize: 20),),
        ],
      )
    );
  }
}
