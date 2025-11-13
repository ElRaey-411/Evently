import '../resources/constant_manager.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favoritesEventsIds,
  });

  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> favoritesEventsIds;

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json[ConstantManager.id],
        name: json[ConstantManager.name],
        email: json[ConstantManager.email],
        favoritesEventsIds:
            (json[ConstantManager.favoritesEventsIds] as List<dynamic>)
                .map((element) => element.toString())
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    ConstantManager.id: id,
    ConstantManager.name: name,
    ConstantManager.email: email,
    ConstantManager.favoritesEventsIds: favoritesEventsIds,
  };
}
