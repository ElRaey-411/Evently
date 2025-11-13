import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/category_model.dart';
import 'package:flutter/material.dart';

import '../resources/constant_manager.dart';

class EventModel {
  EventModel({
    required this.authorId,
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    this.location,
  });

  CategoryModel category;
  String authorId;
  String id;
  String title;
  String description;
  DateTime dateTime;
  String? location;

 EventModel.fromJson(Map<String, dynamic> json , BuildContext context):this(
   authorId: json[ConstantManager.authorId],
   id: json[ConstantManager.id],
   category: CategoryModel.getCategories(context).firstWhere((category) => category.id == json[ConstantManager.categoryId]),
   title: json[ConstantManager.eventTitle],
   description: json[ConstantManager.eventDescription],
   dateTime: (json[ConstantManager.eventDateTime]as Timestamp).toDate(),
 );

  Map<String, dynamic> toJson() =>
      {
        ConstantManager.authorId: authorId,
        ConstantManager.id: id,
        ConstantManager.categoryId: category.id,
        ConstantManager.eventTitle: title,
        ConstantManager.eventDescription: description,
        ConstantManager.eventDateTime: dateTime,
      };


}
