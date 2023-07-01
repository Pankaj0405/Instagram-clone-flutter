
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variables.dart';


class MobileScreenLayout extends StatefulWidget{
  const MobileScreenLayout({Key? key}):super(key:key);





  @override
  State<MobileScreenLayout> createState() {

return _MobileScreenLayoutState();


  }

}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
int _page=0;
late PageController pageController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController= PageController();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

void navigationTapped(int page){
  pageController.jumpToPage(page);
}

void onPageChanged(int page){
  setState(() {
    _page=page;
  });
}

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body:PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,
          color: _page==0? primaryColor: secondaryColor,),
          label: '',
          backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search,
            color: _page==1? primaryColor: secondaryColor,),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,
            color: _page==2? primaryColor: secondaryColor,),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,
            color: _page==3? primaryColor: secondaryColor,),
            label: '',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person
            ,color: _page==4? primaryColor: secondaryColor,),
            label: '',
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }

}