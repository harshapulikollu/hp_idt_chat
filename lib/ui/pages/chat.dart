import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/chat/chat_cubit.dart';
import 'package:hp_idt_chat_test/model/inbox.dart';
import 'package:hp_idt_chat_test/ui/widgets/chat_list.dart';
import 'package:hp_idt_chat_test/ui/widgets/chat_title.dart';
import 'package:hp_idt_chat_test/ui/widgets/error_at_center.dart';
import 'package:hp_idt_chat_test/ui/widgets/loading_indicator_at_center.dart';

///Base [StatefulWidget] for Chat Page
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    final Inbox inboxMessageDetails = ModalRoute.of(context)!.settings.arguments as Inbox;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: ChatTitle(members: inboxMessageDetails.members, topic: inboxMessageDetails.topic, id: inboxMessageDetails.id),
        elevation: 0.0,
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if(state is ChatFetching) return const LoadingIndicatorAtCenter();
          if(state is ChatFetchingFailed){
            return ErrorAtCenter(message: state.message, onPressed: (){
              context.read<ChatCubit>().getChatMessages(inboxMessageDetails.id);
            },);
          }
          if(state is ChatFetchedSuccessfully){
            return ChatList(messages: state.chatMessages,);
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    initPlatformState();
    super.didChangeDependencies();
  }

  void initPlatformState() {
    final details = ModalRoute.of(context)!.settings.arguments as Inbox;
    BlocProvider.of<ChatCubit>(context).getChatMessages(details.id);
  }
}
