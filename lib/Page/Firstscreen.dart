import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider_/user_firstpage_provider.dart';
import 'Secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/icon.png'),
                  const SizedBox(height: 5),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: palindromeController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'Palindrome',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 310,
                height: 41,
                padding: const EdgeInsets.all(1),
                child: ElevatedButton(
                  onPressed: () {
                    String str = palindromeController.text;
                    bool isPalindrome = checkPalindrome(str);
                    String message = isPalindrome
                        ? 'is a palindrome'
                        : 'is not a palindrome';

                    // Show dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: Text(message),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.black,
                    elevation: 5,
                  ),
                  child: const Text('Check'),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 310,
                height: 41,
                padding: const EdgeInsets.all(1),
                child: ElevatedButton(
                  onPressed: () {
                    // Set name in UserFirstPageProvider
                    Provider.of<UserFirstPageProvider>(context, listen: false)
                        .setName(nameController.text);

                    // Navigate to SecondScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.black,
                    elevation: 5,
                  ),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkPalindrome(String str) {
    String cleanedStr = str.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
    return cleanedStr == cleanedStr.split('').reversed.join('');
  }
}
