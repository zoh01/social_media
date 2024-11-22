import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppUSer {
  final String uid;
  final String email;
  final String name;

  AppUSer({
    required this.uid,
    required this.email,
    required this.name,
  });

  /// Convert AppUser => Json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  /// Convert Json => AppUser
  factory AppUSer.fromJson(Map<String, dynamic> jsonUser) {
    return AppUSer(
      uid: jsonUser['uid'],
      email: jsonUser['email'],
      name: jsonUser['name'],
    );
  }
}
