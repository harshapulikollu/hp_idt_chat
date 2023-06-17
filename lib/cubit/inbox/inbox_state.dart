part of 'inbox_cubit.dart';

abstract class InboxState extends Equatable {
  const InboxState();
}

///states for Inbox Page
class InboxInitial extends InboxState {
  @override
  List<Object> get props => [];
}

class InboxFetching extends InboxState {
  @override
  List<Object> get props => [];
}

class InboxFetchingFailed extends InboxState {
  final String message;
  const InboxFetchingFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class InboxFetchedSuccessfully extends InboxState {
  final List<Inbox> inboxMessages;
  const InboxFetchedSuccessfully({required this.inboxMessages});
  @override
  List<Object> get props => [inboxMessages];
}