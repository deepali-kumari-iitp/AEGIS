// Chat Provider
// Per-node chat history state
import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class ChatProvider extends ChangeNotifier {
  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  void sendMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  void receiveMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  void clear() {
    _messages.clear();
    notifyListeners();
  }
}