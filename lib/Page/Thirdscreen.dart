import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider_/User_Provider.dart';
import '../Provider_/Provider.dart';
import 'Secondscreen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(
            height: 1,
            thickness: 1.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, child) {
          return RefreshIndicator(
            onRefresh: () => dataProvider.getData(isRefresh: true), // Pull-to-refresh
            child: ListView.builder(
              controller: dataProvider.scrollController,
              itemCount: dataProvider.daftar.length + 1,
              itemBuilder: (context, index) {
                if (index == dataProvider.daftar.length) {
                  return dataProvider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink();
                }
                final item = dataProvider.daftar[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.avatar),
                      ),
                      title: Row(
                        children: <Widget>[
                          Text(item.first_name),
                          SizedBox(width: 5),
                          Text(item.last_name),
                        ],
                      ),
                      subtitle: Text(item.email),
                      onTap: () {
                        // Set user name in UserProvider
                        Provider.of<UserProvider>(context, listen: false)
                            .setUserName(item.first_name, item.last_name);

                        // Navigate to SecondScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
