import 'package:flutter/material.dart';
import 'package:wallpaper_studio/components/custom_appbar.dart';
import 'package:wallpaper_studio/pages/browser_page.dart';
import 'package:wallpaper_studio/pages/details_page.dart';
import 'package:wallpaper_studio/pages/favorite_page.dart';
import 'package:wallpaper_studio/pages/home_page.dart';
import 'package:wallpaper_studio/pages/settings_page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {

List<Widget> screens =  [
HomePage(),
BrowserPage(),
FavoritePage(),
SettingsPage(),
DetailsPage(),

];

int pageIndex = 0;


void changeScreen(index){

setState(() {
  pageIndex = index;
});

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffF8F8F8) ,
      appBar: CustomAppbar(pageIndex: pageIndex, changeScreen: changeScreen),
      body: screens[pageIndex],
    );
  }
}
