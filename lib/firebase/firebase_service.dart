import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/register_request.dart';
import 'package:evently/core/resources/constant_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/models/event_model.dart';
import '../core/models/login_request.dart';
import '../core/models/user_model.dart';

class FirebaseService {
  static Future<UserCredential> register(
    RegisterRequest registerRequest,
  ) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: registerRequest.email,
          password: registerRequest.password,
        );
    return userCredential;
  }

  static Future<UserCredential> login(LoginRequest loginRequest) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password,
        );
    return userCredential;
  }

  static CollectionReference<UserModel> _getUserCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> userCollection = db
        .collection(ConstantManager.userCollection)
        .withConverter(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    return userCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> userCollection = _getUserCollection();
    DocumentReference<UserModel> userDoc = userCollection.doc(user.id);
    return userDoc.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> userCollection = _getUserCollection();
    DocumentReference<UserModel> userDoc = userCollection.doc(uid);
   DocumentSnapshot<UserModel> userSnapshot = await userDoc.get();
   return userSnapshot.data()!;

  }

  static CollectionReference<EventModel> _getEventCollection(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection(ConstantManager.eventCollection)
        .withConverter(
      fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!,context),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(EventModel event,BuildContext context) {
    CollectionReference<EventModel> eventCollection = _getEventCollection(context);
    DocumentReference<EventModel> eventDoc = eventCollection.doc();
    event.id = eventDoc.id;
    return eventDoc.set(event);
  }

  static Future<void> updateEvent(EventModel event, BuildContext context) {
    CollectionReference<EventModel> eventCollection = _getEventCollection(context);
    DocumentReference<EventModel> eventDoc = eventCollection.doc(event.id);
    return eventDoc.update(event.toJson());
  }


  static Future<List<EventModel>> getEventFromFireStore(BuildContext context, [CategoryModel? category]) async {
    CollectionReference<EventModel> eventCollection = _getEventCollection(context);
    QuerySnapshot<EventModel> eventSnapshots =await eventCollection.where(ConstantManager.categoryId,isEqualTo: category?.id == "0"? null : category?.id).orderBy(ConstantManager.eventDateTime).get();
    List <EventModel> events = eventSnapshots.docs.map((doc)=>doc.data()).toList();
    return events;
  }

  static Stream<List<EventModel>> getEventFromFireStoreRealTime(BuildContext context, CategoryModel category) async* {
    CollectionReference<EventModel> eventCollection = _getEventCollection(context);
 Stream<QuerySnapshot<EventModel>> querySnapshots = eventCollection.where(ConstantManager.categoryId,isEqualTo: category.id == "0"? null : category.id).orderBy(ConstantManager.eventDateTime).snapshots();
   Stream<List<EventModel>> eventsStream = querySnapshots.map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
   yield* eventsStream;
  }

  static Future<void> addEventToFavourites(EventModel event)  {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favoritesEventsIds.add(event.id);
    CollectionReference<UserModel> userCollection = _getUserCollection();
    DocumentReference<UserModel> userDoc = userCollection.doc(currentUser.id);
    return userDoc.set(currentUser);

  }

  static Future<void> removeEventToFavourites(EventModel event)  {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favoritesEventsIds.remove(event.id);
    CollectionReference<UserModel> userCollection = _getUserCollection();
    DocumentReference<UserModel> userDoc = userCollection.doc(currentUser.id);
    return userDoc.set(currentUser);

  }

  static Future<List<EventModel>> getFavouriteEvents(BuildContext context, {
    String searchKey = '',
  })async{
    List<EventModel> events =await getEventFromFireStore(context);
   List<EventModel> favouriteEvents = events.where((events)=>UserModel.currentUser!.favoritesEventsIds.contains(events.id)).toList();
    if (searchKey.isNotEmpty) {
      favouriteEvents = favouriteEvents.where((event) {
        final lowerKey = searchKey.toLowerCase();
        final title = event.title.toLowerCase();
        final description = event.description.toLowerCase();
        return title.contains(lowerKey) || description.contains(lowerKey);
      }).toList();
    }
    return favouriteEvents;
  }

  static Future<void> updateEventToFireStore(EventModel event, BuildContext context) async {
    CollectionReference<EventModel> eventCollection = _getEventCollection(context);
    DocumentReference<EventModel> eventDoc = eventCollection.doc(event.id);
    await eventDoc.update(event.toJson());
  }


}
