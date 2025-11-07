import 'package:evently/core/models/category_model.dart';

class EventModel{
  EventModel({
    required this.category,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDateTime,
     this.eventLocation,
  });
  CategoryModel category;
  String eventTitle;
  String eventDescription;
  DateTime eventDateTime;
  String? eventLocation;

  static List<EventModel> events = [
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
    EventModel(category: CategoryModel.categories[0], eventTitle: "its my birthday", eventDescription: "dawdawda wdawda wd", eventDateTime: DateTime.now()),
  ];


}