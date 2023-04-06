import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:troso/utils/custom_theme.dart';

class GridCard extends StatelessWidget{
  final int index;
  final void Function() onPress;
  const GridCard({Key? key, required this.index, required this.onPress}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Container(
      margin: index % 2 == 0 ? const EdgeInsets.only(left: 22) : const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: CustomTheme.cardShadow,
        ),
        child: GestureDetector(
          onTap: onPress,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Column(
            children: [
              Expanded(
                flex: 7,
                  child: SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://cdn.teknofestmagaza.com/media/upload/userFormUpload/YgSIBxY5egXHVaBKbHhbYxgNub7oq8at.png",
                    fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(children: [
                    Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "title",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ),
                Text(
                  "price",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ]),
              ))
            ],
          ),
      ),
        ),
    );
  }
}














