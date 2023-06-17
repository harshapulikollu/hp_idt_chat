import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_idt_chat_test/cubit/inbox/inbox_cubit.dart';
import 'package:hp_idt_chat_test/ui/widgets/error_at_center.dart';
import 'package:hp_idt_chat_test/ui/widgets/inbox_listview.dart';
import 'package:hp_idt_chat_test/ui/widgets/loading_indicator_at_center.dart';

///Base [StatelessWidget] for Inbox Page
class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Inbox'),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: BlocBuilder<InboxCubit, InboxState>(builder: (BuildContext context, state) {
        if(state is InboxFetching) return const LoadingIndicatorAtCenter();
        if(state is InboxFetchingFailed) {
          return ErrorAtCenter(message: state.message,
          onPressed: (){
            context.read<InboxCubit>().getInboxMessages();
          },);
        }
        if(state is InboxFetchedSuccessfully){
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: InboxListview(inboxMessages: state.inboxMessages,),
              ),
            ],
          );
        }
        return const SizedBox();
      },)
    );
  }
}
