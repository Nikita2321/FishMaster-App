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
      home: SplashScreen(), // Встановлюємо заставку як початковий екран
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
              "FishMaster App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Discover fishing tips and forecasts for anglers',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/logo.jpg', // Замість цього шляху використовуйте шлях до вашого логотипу
              height: 200,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Перехід на MainScreen при натисканні на кнопку
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text('Explore'),
            ),
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
  int _selectedIndex = 0; // Індекс для збереження активної сторінки

  // Список сторінок, між якими ми будемо перемикатися
  static List<Widget> _pages = <Widget>[
    FirstPage(),
    SecondPage(),
    FishMasterApp(),
  ];

  // Оновлюємо індекс при натисканні на іконку в BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Відображення обраної сторінки
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
        currentIndex: _selectedIndex, // Поточний активний індекс
        selectedItemColor: Colors.red, // Колір активної іконки
        unselectedItemColor: Colors.grey, // Колір неактивних іконок
        onTap: _onItemTapped, // Виклик функції при натисканні на іконку
      ),
    );
  }
}