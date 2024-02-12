import 'package:flutter/material.dart';
import 'dart:async';
import 'package:value_kart/widgets/CustomBottomNavigationBar.dart';
import 'package:value_kart/widgets/CustomDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Value Kart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF3b5999).withOpacity(.85),
      ),
      backgroundColor:
          Color.fromARGB(255, 243, 241, 241), // Set the background color here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            height: 130.0,
            width: 500,
            child: PageView.builder(
              controller: _pageController,
              itemCount: bannerImages.length,
              itemBuilder: (context, index) {
                return BannerItem(image: bannerImages[index]);
              },
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String image;

  const BannerItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          image,
          width: 300.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Sample banner images
List<String> bannerImages = [
  'https://m.media-amazon.com/images/G/31/img24/Jan/ART/slider/V1/Home_cleaning_fest_PC._SX1500_QL85_.jpg',
  'https://m.media-amazon.com/images/G/31/img24/Jan/ART/slider/V1/Winter_store_PC._SX1500_QL85_.jpg',
  'https://m.media-amazon.com/images/G/31/img24/Jan/ART/slider/V2/Kelloggs_PC._SX1500_QL85_.jpg',
  // Add more banner image URLs as needed
];
