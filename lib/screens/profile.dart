import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troso/components/custom_button_dart.dart';
import 'package:troso/utils/application_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool _loadingButton = false;

  void signOutButtonPressed() {
    setState(() {
      _loadingButton = true;
    });
    Provider.of<ApplicationState>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Padding(padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "Hi there",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      ),
        //Custom button kodları gelecekkk
        CustomButton(text: "Sign Out", onPress: signOutButtonPressed, loading: _loadingButton,),
      ],
    ),
    );

  }
}
