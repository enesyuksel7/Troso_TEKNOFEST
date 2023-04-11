import 'package:flutter/material.dart';
import 'package:troso/components/custom_button_dart.dart';
import 'package:troso/utils/custom_theme.dart';
import '../components/list_cart.dart';
import '../main.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final carts = ["1","2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: carts.length ,
            itemBuilder: (context, index) {
             return ListCard();
            },
          ),
           priceFooter(),
           Container(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
           child: CustomButton(
             text: "ÖDEME YAP",
             onPress: (){}, loading: false,

           ),
           )
        ],
      ),

    );
    
  }
  priceFooter()
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
    ),
          Padding(
              padding: const EdgeInsets.only( top:20),
          child : Row(
            children: [
              Text("Toplam:", style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              Text("\$ price ", style: Theme.of(context).textTheme.headlineSmall,)
            ],
          ),
          )
      ],
    ),
    );
  }
}
