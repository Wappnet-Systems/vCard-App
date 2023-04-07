// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

import '../utils/constants_color.dart';

class Users {
  final String? name;
  final String? department;
  final String? compeny;
  final String? headline;
  final String? whatsapp;
  final String? telegram;
  final String? snapchat;
  final String? website;
  final String? link;
  final String? facebook;
  final String? email;
  final String? phone;
  final String? address;
  final String? id;
  final String? image;
  final String? type;

  Users(
      {required this.name,
      required this.department,
      required this.compeny,
      required this.headline,
      required this.whatsapp,
      required this.telegram,
      required this.snapchat,
      required this.website,
      required this.link,
      required this.facebook,
      required this.email,
      required this.phone,
      required this.address,
      required this.id,
      required this.type,
      required this.image});
}
