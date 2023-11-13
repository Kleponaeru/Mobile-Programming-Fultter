import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progmob_2023_flutter/constants.dart';

class InsightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 0, top: 30, right: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: Icon(Icons.stacked_bar_chart),
                      subtitle: Text("kelvinlie08@gmail.com"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/insightscreen");
                        // Implement the navigation logic for Home here
                      },
                    ),
                    // Add more ListTiles or other widgets as needed
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: Icon(Icons.stacked_bar_chart),
                      subtitle: Text("kelvinlie08@gmail.com"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/insightscreen");
                        // Implement the navigation logic for Home here
                      },
                    ),
                    // Add more ListTiles or other widgets as needed
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: Icon(Icons.stacked_bar_chart),
                      subtitle: Text("kelvinlie08@gmail.com"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/insightscreen");
                        // Implement the navigation logic for Home here
                      },
                    ),
                    // Add more ListTiles or other widgets as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
