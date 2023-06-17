import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/repository/inbox/get_inbox_repo_interface.dart';

part 'inbox_state.dart';

///Cubit for Inbox page AKA Home page
class InboxCubit extends Cubit<InboxState> {
  InboxCubit(this._getInboxRepoInterface) : super(InboxInitial()) {
    getInboxMessages();
  }
  List<Inbox> _inboxMessages = [];
  final GetInboxRepoInterface _getInboxRepoInterface;

  ///Method to fetch Inbox messages(latest) of all the conversations
  Future<void> getInboxMessages() async {
    emit(InboxFetching());
    try {
      _inboxMessages = await _getInboxRepoInterface.getInbox();
      emit(InboxFetchedSuccessfully(inboxMessages: _inboxMessages.reversed.toList()));
    } catch (e) {
      emit(InboxFetchingFailed(message: e.toString()));
    }
  }
}
