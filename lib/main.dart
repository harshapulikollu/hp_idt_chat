import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/chat/chat_cubit.dart';
import 'package:hp_idt_chat_test/cubit/inbox/inbox_cubit.dart';
import 'package:hp_idt_chat_test/repository/chat/get_chat_repo.dart';
import 'package:hp_idt_chat_test/repository/inbox/get_inbox_repo.dart';
import 'package:hp_idt_chat_test/ui/pages/chat.dart';
import 'package:hp_idt_chat_test/ui/pages/inbox.dart';
import 'package:hp_idt_chat_test/util/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InboxCubit>(
      create: (context) => InboxCubit(GetInboxRepoImp()),
      child: MaterialApp(
        title: 'HP IDT Chat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: UiColors.scaffoldBackgroundColor,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const InboxPage(),
          '/chat': (context) => BlocProvider(create: (context) => ChatCubit(GetChatRepoImp()), child: const ChatPage(),),
        },
      ),
    );
  }
}