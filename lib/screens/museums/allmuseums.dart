import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AllMuseumsPage extends StatefulWidget {
  const AllMuseumsPage({Key? key}) : super(key: key);

  @override
  State<AllMuseumsPage> createState() => _AllMuseumsPageState();
}

class _AllMuseumsPageState extends State<AllMuseumsPage> {

  DateTime tomorrow = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${tomorrow.day}.${tomorrow.month}.${tomorrow.year}";

    // success Alert
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: 'Hesaplanıyor..',
          text: 'Tahmini Kişi Sayısı: 1453',
        );
      },
      title: 'AYASOFYA CAMİ',
      text: "Yarın: "+formattedDate.toString(),
      leadingIcon: Icon(
        Icons.mosque,
        color: Colors.brown,
      ),
    );

    // loading
    final loadingAlert1 = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'AYASOFYA CAMİ',
          text: 'Please wait',
        );
      },
      title: 'ANADOLU MEDENİYETLERİ MÜZESİ',
      text: "Yarın: "+formattedDate.toString(),
      leadingIcon: Icon(
        Icons.museum_outlined,
        color: Colors.blueAccent,
      ),
    );

    // info Alert
    final infoAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          title: 'Hesaplanıyor..',
          text: 'Tahmini Kişi Sayısı: 1453',
        );
      },
      title: 'GALATA KULESİ',
      text: "Yarın: "+formattedDate.toString(),
      leadingIcon: Icon(
        Icons.pix,
        color: Colors.grey,
      ),
    );

    // confirm Alert
    final confirmAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          text: 'Sure you want to logout?',
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: Colors.green,
        );
      },
      title: 'TOPKAPI SARAYI',
      text: "Yarın: "+formattedDate.toString(),
      leadingIcon: Icon(
        Icons.castle_outlined,
        color: Colors.orange,
      ),
    );

    // loading
    final loadingAlert2 = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading...',
          text: 'Please wait',
        );
      },
      title: 'ŞEREFİYE SARNICI',
      text: "Yarın: "+formattedDate.toString(),
      leadingIcon: Icon(
        Icons.pages,
        color: Colors.green,
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://miro.medium.com/v2/resize:fit:425/1*cWFpj7Fp3BgLRC-fz5KUpw.gif'),
            successAlert,
            SizedBox(
              height: 20,
            ),
            loadingAlert1,
            SizedBox(
              height: 20,
            ),
            infoAlert,
            SizedBox(
              height: 20,
            ),
            confirmAlert,
            SizedBox(
              height: 20,
            ),
            loadingAlert2,
          ],
        ),
      ),
        ),
    );
  }
}

// flutter custom card button
Card buildButton({
  required onTap,
  required title,
  required text,
  required leadingIcon,
}) {
  return Card(
    shape: const StadiumBorder(),
    margin: const EdgeInsets.symmetric(
      horizontal: 30,
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 5,
    child: ListTile(
      onTap: onTap,
      leading: leadingIcon,
      title: Text(title ?? ""),
      subtitle: Text(text ?? ""),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    ),
  );
}