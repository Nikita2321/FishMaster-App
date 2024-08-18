import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirstPage.dart';
import 'package:flutter_application_1/SecondPage.dart';
 

void main() {
  runApp(FishMasterApp());
}

class FishMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FishMaster",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Посібник справжнього рибалки',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/logo.jpg',  
              height: 200,
            ),
            SizedBox(height: 24),
            ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 97, 92, 255),// Встановлюємо основний колір червоним, відповідно до теми
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Трохи менш закруглені кути, як на інших сторінках
    ),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Оптимальні відступи
    textStyle: TextStyle(
      fontSize: 18,  // Розмір шрифту, узгоджений з іншими сторінками
    ),
  ),
  child: Text('Дослідити'),
  
  
)
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;  

   
  static List<Widget> _pages = <Widget>[
    FirstPage(),
    SecondPage(),
    FishMasterApp(),
  ];

 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],  
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Third',
          ),
        ],
        currentIndex: _selectedIndex, 
        selectedItemColor: Colors.red,  
        unselectedItemColor: Colors.grey,  
        onTap: _onItemTapped, 
      ),
    );
  }
}