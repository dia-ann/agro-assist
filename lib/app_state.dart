import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _currentlocation = LatLng(15.599483, 73.76913499999999);
  LatLng? get currentlocation => _currentlocation;
  set currentlocation(LatLng? value) {
    _currentlocation = value;
  }

  double _currentlat = 15.6;
  double get currentlat => _currentlat;
  set currentlat(double value) {
    _currentlat = value;
  }

  double _currentlng = 73.75;
  double get currentlng => _currentlng;
  set currentlng(double value) {
    _currentlng = value;
  }

  List<String> _chatList = [];
  List<String> get chatList => _chatList;
  set chatList(List<String> value) {
    _chatList = value;
  }

  void addToChatList(String value) {
    chatList.add(value);
  }

  void removeFromChatList(String value) {
    chatList.remove(value);
  }

  void removeAtIndexFromChatList(int index) {
    chatList.removeAt(index);
  }

  void updateChatListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatList[index] = updateFn(_chatList[index]);
  }

  void insertAtIndexInChatList(int index, String value) {
    chatList.insert(index, value);
  }

  String _botReply = '';
  String get botReply => _botReply;
  set botReply(String value) {
    _botReply = value;
  }

  String _recognizedText = '';
  String get recognizedText => _recognizedText;
  set recognizedText(String value) {
    _recognizedText = value;
  }

  String _globalweather = '';
  String get globalweather => _globalweather;
  set globalweather(String value) {
    _globalweather = value;
  }
}
