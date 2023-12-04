import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_2023_flutter/constants.dart';
import 'package:progmob_2023_flutter/details_screen.dart';
import 'package:progmob_2023_flutter/fetch_data.dart';
import 'package:progmob_2023_flutter/insight_screen.dart';
import 'package:progmob_2023_flutter/map.dart';
import 'package:progmob_2023_flutter/model/category.dart';
import 'package:progmob_2023_flutter/profile_screen.dart';
import 'package:progmob_2023_flutter/send_data.dart';
import 'package:progmob_2023_flutter/update_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomeScreen(),
      routes: {
        '/profilescreen': (context) => ProfileScreen(),
        '/detailscreen': (context) => DetailsScreen(),
        '/insightscreen': (context) => InsightScreen(),
        '/fetchdata': (context) => FetchData(),
        '/senddata': (context) => SendData(),
        '/updatedata': (context) => UpdateData(),
        '/map': (context) => MapScreen(),

      },
    );
  }
}
class HomeScreen extends StatelessWidget {
  final GlobalKey <ScaffoldState>_scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.lightGreen,
            //   ),
            //   child: Text(''),
            // ),
            const UserAccountsDrawerHeader(

              accountName: Text("Kelvin Lie"),
              accountEmail: Text("kelvinlie08@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child:
                  Icon(Icons.person, size: 40),
                ),
            ),
            ListTile(
              title: const Text('Insight'),
              leading: const Icon(Icons.insights),
              subtitle: const Text("See your insight of this month"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/insightscreen");
                // Implement the navigation logic for Home here
              },
            ),
            ListTile(
              title: const Text('Chat'),
              leading: const Icon(Icons.chat_bubble_rounded),
              subtitle: const Text("Chat with other users"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic for Home here
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/profilescreen");
              },
            ),

            ListTile(
              title: const Text('Fetch Data'),
              leading: const Icon(Icons.data_exploration),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetchdata");
              },
            ),
            ListTile(
              title: const Text('Send Data'),
              leading: const Icon(Icons.send),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/senddata");
              },
            ),

            ListTile(
              title: const Text('Update Data'),
              leading: const Icon(Icons.update),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/updatedata");
              },
            ),

            ListTile(
              title: const Text('Delete Data'),
              leading: const Icon(Icons.delete),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/deletedata");
              },
            ),

            ListTile(
              title: const Text('Map'),
              leading: const Icon(Icons.map_rounded),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/map");
              },
            ),
            const Divider(
              color: Colors.blueGrey,
              thickness: 0.15,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/profilescreen");
              },
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Scaffold.of(context).openDrawer();
                    if(_scaffoldKey.currentState != null){
                      _scaffoldKey.currentState!.openDrawer();
                    }
                  },
                  child: SvgPicture.asset("assets/icons/menu.svg"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/profilescreen");
                  },
                  child: Image.asset("assets/images/user.png"),
                ),
              ],
            ),


  const SizedBox(height: 30),
            const Text("Hey Alex,", style: kHeadingextStyle),
            const Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  const SizedBox(width: 16),
                  const Text(
                    "Search for anything",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Category", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/detailscreen");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
