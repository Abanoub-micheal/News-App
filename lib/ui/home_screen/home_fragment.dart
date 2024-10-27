import 'package:flutter/material.dart';
import 'package:news_application/model/category_dm.dart';
import 'package:news_application/my_theme.dart';
import 'package:news_application/ui/home_screen/category_item.dart';

class HomeFragment extends StatelessWidget {
 HomeFragment({super.key,required this.onCategoryItemClick});
 final Function onCategoryItemClick;
 final List<CategoryDm> categoryList=CategoryDm.categoryList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            'Pick your category \n of interest',
            style: TextStyle(
                color: MyTheme.grayColor,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ), 
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                  onCategoryItemClick(categoryList[index]);
                },child: CategoryItem(category: categoryList[index], index: index));
              },
            ),
          )
        ],
      ),
    );
  }
}
