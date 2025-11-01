import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? latlngtostring(
  LatLng latlng,
  bool islat,
) {
  if (islat) {
    return latlng.latitude.toString();
  } else {
    return latlng.longitude.toString();
  }
}

DateTime convertunixtodatetime(String unixstring) {
// Safely parse the string into an int
  int unixSeconds = int.tryParse(unixstring) ?? 0;

  // Convert from seconds → milliseconds → DateTime
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(unixSeconds * 1000, isUtc: true)
          .toLocal();

  return dateTime;
}

double getlatitude(LatLng? location) {
  return location?.latitude ?? 0.0;
}

double getlongitude(LatLng? location) {
  return location?.longitude ?? 0.0;
}

String? getMessageText(String? jsonMessage) {
  final msg = jsonDecode(jsonMessage ?? '');
  return msg['text'];
}

bool? isUserMessage(String? jsonMessage) {
  final msg = jsonDecode(jsonMessage ?? '');
  return msg['sender'] == 'user';
}

bool? isBotMessage(String? jsonMessage) {
  final msg = jsonDecode(jsonMessage ?? '');
  return msg['sender'] == 'bot';
}
