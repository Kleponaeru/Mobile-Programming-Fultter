import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_2023_flutter/constants.dart';
import 'package:progmob_2023_flutter/delete_data.dart';
import 'package:progmob_2023_flutter/details_screen.dart';
import 'package:progmob_2023_flutter/fetch_data.dart';
import 'package:progmob_2023_flutter/insight_screen.dart';
import 'package:progmob_2023_flutter/model/category.dart';
import 'package:progmob_2023_flutter/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:progmob_2023_flutter/send_data.dart';
import 'package:progmob_2023_flutter/update_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
        '/deletedata': (context) => DeleteData(),


      },
    );
  }
}
class HomeScreen extends StatelessWidget {
  final GlobalKey <ScaffoldState>_scaffoldKey = GlobalKey<ScaffoldState>();
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
            UserAccountsDrawerHeader(

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
              leading: Icon(Icons.insights),
              subtitle: Text("See your insight of this month"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/insightscreen");
                // Implement the navigation logic for Home here
              },
            ),
            ListTile(
              title: const Text('Chat'),
              leading: Icon(Icons.chat_bubble_rounded),
              subtitle: Text("Chat with other users"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Implement the navigation logic for Home here
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/profilescreen");
              },
            ),

            ListTile(
              title: const Text('Fetch Data'),
              leading: Icon(Icons.data_exploration),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/fetchdata");
              },
            ),
            ListTile(
              title: const Text('Send Data'),
              leading: Icon(Icons.send),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/senddata");
              },
            ),

            ListTile(
              title: const Text('Update Data'),
              leading: Icon(Icons.update),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/updatedata");
              },
            ),

            ListTile(
              title: const Text('Delete Data'),
              leading: Icon(Icons.delete),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/deletedata");
              },
            ),

            Divider(
              color: Colors.blueGrey,
              thickness: 0.15,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, "/profilescreen");
              },
            ),

          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
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


  SizedBox(height: 30),
            Text("Hey Alex,", style: kHeadingextStyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
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
                Text("Category", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
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
                      padding: EdgeInsets.all(20),
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
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
