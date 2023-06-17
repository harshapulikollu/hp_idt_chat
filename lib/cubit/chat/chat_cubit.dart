import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/inbox/inbox_cubit.dart';
import 'package:hp_idt_chat_test/model/chat.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/repository/chat/get_chat_repo_interface.dart';

part 'chat_state.dart';

/// this Cubit takes care of the state management for chat detail screen
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getChatRepoInterface) : super(ChatInitial());

  final GetChatRepoInterface _getChatRepoInterface;
  List<Chat> _message = [];

  ///[ScrollController] to scroll end of the list when a new message being sent or received
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ///[FocusNode] maintaining focus node of text field when user sends a message and ready to send another,
  ///without again tapping on text field for focus
  final FocusNode _focusNode = FocusNode();
  FocusNode  get focusNode => _focusNode;

  ///Method to fetch list of chat messages for particular group/peer chat ID
  Future<void> getChatMessages(String groupId) async {
    emit(ChatFetching());
    try {
      _message = await _getChatRepoInterface.getChat(groupId);
      _message = _message.reversed.toList();

      emit(ChatFetchedSuccessfully(chatMessages: _message));
    } catch (e) {
      emit(ChatFetchingFailed(message: e.toString()));
    }
  }

  ///Method to send/publish a new message from user to the current chat thread
  void sendMessage(String message, {bool isAutomatedMessage = false}){
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    String sender = isAutomatedMessage ? _message[0].sender :'you';
    Chat newMessage = Chat(id: timestamp.toString(), message: message.trim(), modifiedAt: timestamp, sender: sender);
    emit(ChatFetchedSuccessfully(chatMessages: [..._message, newMessage]));
    _message.add(newMessage);
    ///Added a delay just to make sure that new messages were added and UI states were updated before scrolling to end of listview for new messages
    Future.delayed(const Duration(milliseconds: 100), (){_scrollController.jumpTo(_scrollController.position.maxScrollExtent);});
    _focusNode.requestFocus();
  }

  ///Method to send an random automatic reply with a delay of 1 second
  void sendReplyMessage() {
    List<String> randomMessages = ["Hi", "Lol", "Whatsup", "duh", 'I\'m busy, TTYL!'];

    Future.delayed(const Duration(seconds: 1), (){
      sendMessage(randomMessages[_getRandomNumber(randomMessages.length)], isAutomatedMessage: true);
    });
  }

  ///Common method to get random number
  int _getRandomNumber(int length) {
    Random random = Random();
    return random.nextInt(length);
  }
}
