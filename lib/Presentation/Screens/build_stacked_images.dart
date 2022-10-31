import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_n_train_task/Constants/app_constants.dart';
import 'package:meet_n_train_task/Data/Models/user_base_model.dart';

class BuildStackedImages extends StatelessWidget {
  final TextDirection? direction;
  final List<UserModel> userList;

  const BuildStackedImages(
      {Key? key, this.direction = TextDirection.ltr, required this.userList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(
      userList.length,
      (index) => Padding(
          padding: EdgeInsets.only(
              left: index.toDouble() * 20, top: 1, bottom: 1, right: 1),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppConstants.lightWhiteColor,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: AppConstants.lightWhiteColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://ik.imagekit.io/tnc8pizf9e/${userList[index].profilePicture}?tr=w-28,h-28',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    ));
  }
}
