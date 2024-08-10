import 'package:coba/Provider_/user_firstpage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider_/User_Provider.dart';
import 'Thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userfirstProvider = Provider.of<UserFirstPageProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(
            height: 1,
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              userfirstProvider.name, // Tampilkan nama yang dikirim dari FirstScreen
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        return Text(
                          userProvider.fullName.isNotEmpty
                              ? userProvider.fullName // Tampilkan nama pengguna yang dipilih
                              : 'Selected User Name', // Tampilkan default 'Selected User Name' jika belum ada pengguna yang dipilih
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 310,
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue,
                      shadowColor: Colors.black,
                      elevation: 5,
                    ),
                    child: const Text('Choose User'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
