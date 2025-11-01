// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// MODIFY CODE ONLY BELOW THIS LINE
import 'dart:convert';

Future<List<String>> simulateBotResponse(
  List<String> chatList,
  String userMessage,
) async {
  // 1️⃣ Add user's message immediately
  final userMsg = jsonEncode({
    'sender': 'user',
    'text': 'You: $userMessage',
  });
  chatList.add(userMsg);

  // 2️⃣ Add temporary bot placeholder (typing...)
  chatList.add(jsonEncode({
    'sender': 'bot',
    'text': 'Disha is typing...',
  }));

  // ✅ 3️⃣ Wait here — delay only before bot’s real reply
  await Future.delayed(const Duration(seconds: 1));

  // 4️⃣ Replace placeholder with actual bot reply
  chatList.removeLast();
  final botReply = jsonEncode({
    'sender': 'bot',
    'text':
        '🌱 Disha: Plants love early morning watering and rich compost soil!',
  });
  chatList.add(botReply);

  // 5️⃣ Return the updated list
  return chatList;
}

/// MODIFY CODE ONLY ABOVE THIS LINE
