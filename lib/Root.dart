import 'package:flutter/material.dart';
import 'package:souq_application_1/screens/Bacet.dart';
import 'package:souq_application_1/screens/Home.dart';
import 'package:souq_application_1/screens/favorite.dart';
import 'package:souq_application_1/screens/profile.dart';
import 'package:souq_application_1/theme/color.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}


class _RootState extends State<Root> {
  final PageController controller =PageController();
List<Widget>screen =[
  Home(),
  Backet(),
  Favorite(),
  Profile()
];
int selectedscreen =0 ;
 @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screen,
        
         onPageChanged: (v) {
          selectedscreen = v;
          setState(() {
            selectedscreen = v;
         
          });
        },

      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
         currentIndex: selectedscreen,
        selectedItemColor:UColor.primary ,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
          selectedscreen =index;
          controller.jumpToPage(index);
          });
        },
          type: BottomNavigationBarType.fixed,
       items: const [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined,),
    label: "الرئيسية",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_outlined),
    label: "السلة",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: "المفضلة",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline),
    label: "حسابي",
  ),
],
        
        ),
    
    );
  }
}