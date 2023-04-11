import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MuseumScreen extends StatefulWidget {
  const MuseumScreen({Key? key}) : super(key: key);

  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  var predValue = "";
  @override
  void initState() {
    super.initState();
    predValue = "...";
  }

  Future<void> predData() async {
    final interpreter = await Interpreter.fromAsset('predmodel.tflite');
    var input = [
      [953.0, 1075.0, 1695.0, 3736.0, 5340.0]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    this.setState(() {
      predValue = output[0][0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26BACB),
        title: Text("Ayasofya Camii"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://cdnuploads.aa.com.tr/uploads/Contents/2020/07/10/thumbs_b_c_2137b702b297782cea575054314ba8fe.jpg?v=121532'),
            Text(
              "Yarının ziyaretçi sayısını tahmin etmek için tıklayınız:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            MaterialButton(
              color: Color(0xFF26BACB),
              child: Text(
                "Tahmin Et",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: predData,
            ),
            SizedBox(height: 12),
            Text(
              "Yarınki ziyaretçi sayısı:  $predValue ",
              style: TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
