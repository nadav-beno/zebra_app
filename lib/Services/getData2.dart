import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:zebra_app/Pages/Setting.dart';

class GetData2{
  final String id;
  final String title;
  final String url;

  GetData2({
    this.id = '',
    this.url = '',
    this.title = ''
  }) ;

  factory GetData2.fromJson(Map<String, dynamic> json){
    return new GetData2(
      id: json['id'].toString(),
      title: json['title'],
      url: json['json'],
    );
  }
}