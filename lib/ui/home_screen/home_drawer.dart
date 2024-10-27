import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
 final Function onDrawerMenuClick;
  const HomeDrawer({super.key,required this.onDrawerMenuClick});


  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.15,
          color: Theme.of(context).primaryColor,
          child: const Center(child: Text('News App!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(onTap: () {
            onDrawerMenuClick(MenuItem.categories);
          },
            child: const Row(
              children: [
                Icon(Icons.list,size: 30,),
                SizedBox(width: 10,),
                Text('Categories',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(onTap: () {
            onDrawerMenuClick(MenuItem.settings);
          },
            child: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text('Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            ),
          ),
        ),

      ],
    );
  }
}
enum MenuItem{
  categories,
  settings

}