import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:troso/screens/model_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  List<Map<String, dynamic>> cards = [
    {
      'title': 'Kart Başlık 1',
      'description': 'Kart Açıklama 1',
      'image': 'https://picsum.photos/200/300',
      'route': '/page1',
    },
    {
      'title': 'Kart Başlık 2',
      'description': 'Kart Açıklama 2',
      'image': 'https://picsum.photos/200/300',
      'route': '/page2',
    },
    {
      'title': 'Kart Başlık 3',
      'description': 'Kart Açıklama 3',
      'image': 'https://picsum.photos/200/300',
      'route': '/page3',
    },
    {
      'title': 'Kart Başlık 4',
      'description': 'Kart Açıklama 4',
      'image': 'https://picsum.photos/200/300',
      'route': '/page4',
    },
    {
      'title': 'Kart Başlık 5',
      'description': 'Kart Açıklama 5',
      'image': 'https://picsum.photos/200/300',
      'route': '/page5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kart Örneği'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(cards[index]['route']);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(cards[index]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cards[index]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          cards[index]['description'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(cards[index]['route']);
                          },
                          child: Text('Detay'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}