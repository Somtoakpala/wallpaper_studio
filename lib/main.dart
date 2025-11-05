import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_studio/pages/wrapper_page.dart';
import 'package:wallpaper_studio/provider_class/grid_notifier.dart';

void main(){



runApp(
   ChangeNotifierProvider(
      create: (context) => GridNotifier(),
      child:  WallPaperStudio()),
    );
  
 

}





class WallPaperStudio extends StatelessWidget {
  const WallPaperStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleWH: () => true,
      enableScaleText: () => true,
      designSize: const Size(1440, 1051), // ← use your Figma frame size
      minTextAdapt: true,
      
      builder: (context, child){
return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: WrapperPage(),
      theme: ThemeData(
      fontFamily: 'Poppins',
        ),
      
      );

      },
       
    );
  }
}