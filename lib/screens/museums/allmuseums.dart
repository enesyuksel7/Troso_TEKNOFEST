import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AllMuseumsPage extends StatefulWidget {
  const AllMuseumsPage({Key? key}) : super(key: key);

  @override
  State<AllMuseumsPage> createState() => _AllMuseumsPageState();
}

class _AllMuseumsPageState extends State<AllMuseumsPage> {
  @override
  Widget build(BuildContext context) {
    // success Alert
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Form Submitted Successfully!',
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingIcon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
    );

    // loading
    final loadingAlert1 = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading...',
          text: 'Please wait',
        );
      },
      title: 'Loading',
      text: 'Please Wait',
      leadingIcon: Icon(
        Icons.downloading,
        color: Colors.greenAccent,
      ),
    );

    // info Alert
    final infoAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          title: 'New Offer',
          text: 'Get Discount of 50% , On showing of Rs 5000',
        );
      },
      title: 'Info',
      text: 'Learn More..!',
      leadingIcon: Icon(
        Icons.info,
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
      title: 'Confirm',
      text: 'Do you want to logout',
      leadingIcon: Icon(
        Icons.logout,
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
      title: 'Loading',
      text: 'Please Wait',
      leadingIcon: Icon(
        Icons.downloading,
        color: Colors.greenAccent,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
                onPressed: () {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: "The Action was Successful",
                      text: "Subscribe to Proto Coders Point",
                      textColor: Colors.red,
                      autoCloseDuration: Duration(seconds: 2));
                },
                child: Text("Show Success"))
          ],
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
      horizontal: 20,
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 1,
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