import 'package:flutter/material.dart';
import 'package:yes_no_app_chat/config/helpers/get_yes_no_answer.dart';

import '../../domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola Amor!!!', fromWho: FromWho.my, created: DateTime.now()),
    Message(
        text: 'Ya regresaste del trabajo ???',
        fromWho: FromWho.my,
        created: DateTime.now()),
    // Message(
    //     text: 'Ya regresé del Trabajo !!!',
    //     fromWho: FromWho.hers,
    //     created: DateTime.now())
  ];

  Future<void> sendMessage(String text) async {
    final message =
        Message(text: text, fromWho: FromWho.my, created: DateTime.now());
    messages.add(message);

    //If message is a question use our wrapper class
    //to create a request to yes_no_wtf API

    //Note: In this point we can change for requesting to
    //LLM request

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
