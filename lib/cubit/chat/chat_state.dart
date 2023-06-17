part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

///States for Chat Page
class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatFetching extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatFetchingFailed extends ChatState {
  final String message;
  const ChatFetchingFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class ChatFetchedSuccessfully extends ChatState {
  final List<Chat> chatMessages;
  final bool isTyping;
  const ChatFetchedSuccessfully({required this.chatMessages, this.isTyping = false});
  @override
  List<Object> get props => [chatMessages, isTyping];
}