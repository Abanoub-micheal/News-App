import 'package:flutter/material.dart';
import 'package:news_application/model/category_dm.dart';
import 'package:news_application/ui/category_details/category_details.dart';
import 'package:news_application/ui/home_screen/home_drawer.dart';
import 'package:news_application/ui/setting/setting_screen.dart';

import 'home_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget=HomeFragment(onCategoryItemClick: onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [Container(margin: const EdgeInsets.only(right: 15),child: IconButton(onPressed: () {

            }, icon: const Icon(Icons.search_sharp)))],
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            title:  const Text('News App',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          body:selectedWidget,

         drawer: Drawer( width: MediaQuery.of(context).size.width*0.75,child: HomeDrawer( onDrawerMenuClick: onDrawerMenuClick,),),

        )
      ],
    );
  }

 
 late Widget selectedWidget;

  void onCategoryItemClick(CategoryDm category){
     selectedWidget=CategoryDetails(category: category);
   setState(() {

   });
  }
  void onDrawerMenuClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case  MenuItem.settings :{
        selectedWidget = const SettingScreen();

      }
      case MenuItem.categories:{

        selectedWidget=HomeFragment(onCategoryItemClick: onCategoryItemClick);

      }
    }
    setState(() {

    });
  }
  
}
