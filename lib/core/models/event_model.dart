import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../resources/constant_manager.dart';

class EventModel {
  EventModel({
    required this.authorId,
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.city,
    required this.country,
    required this.lat,
    required this.long,
  });

  CategoryModel category;
  String authorId;
  String id;
  String title;
  String description;
  DateTime dateTime;
  String city;
  String country;
  double lat;
  double long;

 EventModel.fromJson(Map<String, dynamic> json , BuildContext context):this(
   authorId: json[ConstantManager.authorId],
   id: json[ConstantManager.id],
   category: CategoryModel.getCategories(context).firstWhere((category) => category.id == json[ConstantManager.categoryId]),
   title: json[ConstantManager.eventTitle],
   description: json[ConstantManager.eventDescription],
   dateTime: (json[ConstantManager.eventDateTime]as Timestamp).toDate(),
   city: json[ConstantManager.city],
   country: json[ConstantManager.country],
   lat: json[ConstantManager.lat],
   long: json[ConstantManager.long],

 );

  Map<String, dynamic> toJson() =>
      {
        ConstantManager.authorId: authorId,
        ConstantManager.id: id,
        ConstantManager.categoryId: category.id,
        ConstantManager.eventTitle: title,
        ConstantManager.eventDescription: description,
        ConstantManager.eventDateTime: dateTime,
        ConstantManager.city: city,
        ConstantManager.country: country,
        ConstantManager.lat: lat,
        ConstantManager.long: long,
      };


}
