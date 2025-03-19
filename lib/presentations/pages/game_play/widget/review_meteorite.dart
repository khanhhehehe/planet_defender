import 'package:planet_defender/gen/assets.gen.dart';
import 'package:flutter/material.dart';

List<Widget> reviewMeteorite(BuildContext context) {
  return [
    Positioned(
        top: MediaQuery.sizeOf(context).height / 3.6,
        child: Image.asset(
          Assets.images.asteroid1.path,
          width: MediaQuery.sizeOf(context).width / 2,
          height: MediaQuery.sizeOf(context).width / 2,
          fit: BoxFit.fitHeight,
        )),
    Positioned(
        right: MediaQuery.sizeOf(context).width / 1.7,
        top: MediaQuery.sizeOf(context).height / 7,
        child: Image.asset(
          Assets.images.asteroid1.path,
          width: MediaQuery.sizeOf(context).width / 3.35,
          height: MediaQuery.sizeOf(context).width / 3.35,
          fit: BoxFit.fitHeight,
        )),
    Positioned(
        left: MediaQuery.sizeOf(context).width / 1.5,
        top: MediaQuery.sizeOf(context).height / 5,
        child: Image.asset(
          Assets.images.asteroid4.path,
          width: MediaQuery.sizeOf(context).width / 4.5,
          height: MediaQuery.sizeOf(context).width / 4.5,
          fit: BoxFit.fitHeight,
        )),
    Positioned(
        left: MediaQuery.sizeOf(context).width / 2,
        top: MediaQuery.sizeOf(context).height / 13,
        child: Image.asset(
          Assets.images.asteroid3.path,
          width: MediaQuery.sizeOf(context).width / 3.5,
          height: MediaQuery.sizeOf(context).width / 3.5,
          fit: BoxFit.fitHeight,
        )),
  ];
}
