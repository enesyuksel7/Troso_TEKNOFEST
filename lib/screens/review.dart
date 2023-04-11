import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:troso/screens/model_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class CardItem {
  final String title;
  final String imagePath;
  final String routeName;

  CardItem({required this.title, required this.imagePath, required this.routeName});
}

final List<CardItem> cardItems = [
  CardItem(title: "Kart 1", imagePath: "assets/images/images1.jpg", routeName: "/page1"),
  CardItem(title: "Kart 2", imagePath: "assets/images/images2.jpg", routeName: "/page2"),
  CardItem(title: "Kart 3", imagePath: "assets/images/images3.jpg", routeName: "/page3"),
  CardItem(title: "Kart 4", imagePath: "assets/images/images4.jpg", routeName: "/page4"),
  CardItem(title: "Kart 5", imagePath: "assets/images/images5.jpg", routeName: "/page5"),
];

class _ReviewScreenState extends State<ReviewScreen> {

  final List<String> modelPaths = [    "assets/jet/Jet.obj",    "assets/shark/shark.obj",    "assets/jet/Jet.obj",    "assets/shark/shark.obj"  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,,
        children: cardItems.map((card) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, card.routeName);
            },
            child: Hero(
              tag: card.title,
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      card.imagePath,
                      fit: BoxFit.contain,
                      height: 120,
                    ),
                    Text(
                      card.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 1")),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Hero(
            tag: "Kart 1",
            child: Image.asset("assets/images/image1.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 2")),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Hero(
            tag: "Kart 2",
            child: Image.asset("assets/images/image2.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 3")),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Hero(
            tag: "Kart 3",
            child: Image.asset("assets/images/image3.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 4")),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Hero(
            tag: "Kart 4",
            child: Image.asset("assets/images/image4.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 5")),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Hero(
            tag: "Kart 5",
            child: Image.asset("assets/images/image5.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}