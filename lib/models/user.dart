import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    int id,
    String name,
    int age
  }) = _User;
}