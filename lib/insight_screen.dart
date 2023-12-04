import 'package:flutter/material.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 0, top: 30, right: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Column(
                  children: [
                    const UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: const Icon(Icons.stacked_bar_chart),
                      subtitle: const Text("kelvinlie08@gmail.com"),
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
                    const UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: const Icon(Icons.stacked_bar_chart),
                      subtitle: const Text("kelvinlie08@gmail.com"),
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
                    const UserAccountsDrawerHeader(
                      accountName: Text("Kelvin Lie"),
                      accountEmail: Text("kelvinlie08@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40),
                      ),
                    ),
                    ListTile(
                      title: const Text('Kelvin Lie'),
                      leading: const Icon(Icons.stacked_bar_chart),
                      subtitle: const Text("kelvinlie08@gmail.com"),
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
