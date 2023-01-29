import 'package:flutter/material.dart';
import 'package:mouseregion/another_example_mouse_region.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MouseRegionCount(),
    );
  }
}

 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
 
 class AnimatedBottomBar extends StatefulWidget {
   const AnimatedBottomBar({Key? key, this.title}) : super(key: key);
 
   final String? title;
 
   @override
   _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
 }
 
 class _AnimatedBottomBarState extends State<AnimatedBottomBar>
     with TickerProviderStateMixin {
   // TabController? _tabController;
   final myController = Get.put(Controller());
 
   @override
   void initState() {
     super.initState();
     myController._tabController = TabController(
       initialIndex: 1,
       length: 4,
       vsync: this,
     );
   }
 
   @override
   void dispose() {
     super.dispose();
     myController._tabController!.dispose();
   }
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text(widget.title ?? '')),
       bottomNavigationBar: MotionTabBar(
         initialSelectedTab: "Home",
         useSafeArea: true,
         // default: true, apply safe area wrapper
         labels: const ["Dashboard", "Home", "Profile", "Settings"],
         icons: const [
           Icons.dashboard,
           Icons.home,
           Icons.people_alt,
           Icons.settings
         ],
 
         tabSize: 50,
         tabBarHeight: 55,
         textStyle: const TextStyle(
           fontSize: 12,
           color: Colors.white,
           fontWeight: FontWeight.w500,
         ),
         tabIconColor: Colors.blue[600],
         tabIconSize: 28.0,
         tabIconSelectedSize: 26.0,
         tabSelectedColor: Colors.blue,
         tabIconSelectedColor: Colors.white,
         tabBarColor: Colors.black /*const Color(0xFFAFAFAF)*/,
         onTabItemSelected: (int value) {
           myController.tabIndex.value = value;
           // setState(() {
           //   _tabController!.index = value;
           // });
         },
       ),
       body: TabBarView(
         physics: const NeverScrollableScrollPhysics(),
         controller: myController._tabController,
         children: const [
           Center(child: Text("Dashboard")),
           Center(child: Text("Home")),
           Center(child: Text("Profile")),
           Center(child: Text("Settings")),
         ],
       ),
     );
   }
 }
 
 class Controller extends GetxController {
   TabController? _tabController;
   var tabIndex = 0.obs;
 
   void changeTabIndex(int index) {
     tabIndex.value = index;
   }
 }
