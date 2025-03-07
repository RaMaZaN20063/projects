//'это должно быть добавлено
//dependencies:
//  json_annotation: ^4.8.1

//dev_dependencies:
  //build_runner: ^2.4.6
  //json_serializable: ^6.7.1
  

// Создаем модель данных (user.dart)
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  // Фабричный конструктор для создания объекта из JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Метод для конвертации объекта в JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


// Используем JSON
import 'dart:convert';
import 'user.dart';

void main() {
  // Пример JSON-данных
  String jsonString = '{"name": "Абиш", "age": 20}';
  
  // Декодируем JSON в объект User
  User user = User.fromJson(jsonDecode(jsonString));
  print("Имя: ${user.name}, Возраст: ${user.age}");

  // Кодируем объект User в JSON
  String encodedJson = jsonEncode(user.toJson());
  print("JSON: $encodedJson");
}

//JSON → Dart объект (fromJson).
//Dart объект → JSON (toJson).
