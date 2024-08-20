import 'package:flutter/material.dart';
import 'package:flutter_application_1/VideoPage.dart'; // Замініть шлях на правильний для вашого проекту

void main() {
  runApp(FishMasterApp());
}

class FishMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.red,
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
    HomeScreen(),
    TipsPage(),
    VideoPlayerScreen(videoUrl: 'https://www.youtube.com/watch?v=7d2L8loFtXM',),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fish Master',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Дія при натисканні на іконку пошуку
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Головна',
            backgroundColor: Colors.red, // Делаем кнопку "Home" красной
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Поради',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Відео',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red, // Также выделяем текст "Home" красным
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3, // Задать такой же размер, как у нижних квадратов
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0, // Убрать тень
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Сдвигаем изображение левее, убирая отступ слева
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/pike.jpg', // Ваше изображение
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0), // Увеличиваем отступ слева для текста
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Прогноз клювання',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                       height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    'Обери вдалий час для рибалки.\n',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                        height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                             SizedBox(width: 1), 
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                    videoUrl: 'https://www.youtube.com/watch?v=7d2L8loFtXM',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 97, 92, 255),
                              foregroundColor: Colors.white,
                          
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Запланувати'),
                            
                          
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Уменьшить отступ
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 4 / 5, // Больше места для текста внизу
                children: [
                  buildCategoryCard(
                    context,
                    'Поради',
                    'assets/video1.jpg',
                    TipsPage(),
                  ),
                  buildCategoryCard(
                    context,
                    'Техніка',
                    'assets/fish3.jpg',
                    SecondPage(),
                  ),
                  buildCategoryCard(
                    context,
                    'Відео',
                    'assets/fish2.jpg',
                    GearReviewsPage(),
                  ),
                  buildCategoryCard(
                    context,
                    'Прогноз',
                    'assets/fish1.jpg',
                    ForecastPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0, // Убрать тень
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12), // Увеличить отступ между изображением и текстом
             Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Увеличиваем отступ снизу текста
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поради'),
      ),
      body: Center(
        child: Text('Тут буде інформація про риболовні поради'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Техніка'),
      ),
      body: Center(
        child: Text('Тут буде інформація про техніку риболовлі'),
      ),
    );
  }
}

class GearReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Огляд спорядження'),
      ),
      body: Center(
        child: Text('Тут буде інформація про огляди спорядження'),
      ),
    );
  }
}

class ForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Прогноз'),
      ),
      body: Center(
        child: Text('Тут буде інформація про прогнози риболовлі'),
      ),
    );
  }
}