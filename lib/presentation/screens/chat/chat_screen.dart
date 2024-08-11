import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";
import "package:yes_no_app_chat/presentation/providers/chat_provider.dart";
import "package:yes_no_app_chat/presentation/widgets/chats/my_message_bubble.dart";
import "package:yes_no_app_chat/presentation/widgets/shared/message_field_box.dart";

import "../../../domain/entities/messages.dart";
import "../../widgets/chats/her_message_bubble.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Gal_Gadot_2018_cropped_retouched.jpg/640px-Gal_Gadot_2018_cropped_retouched.jpg'),
          ),
        ),
        title: const Text('Mi amor ♥'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    //Lef all space for
    return SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //All space for chield
            //Ex: Put all area in red
            //Expanded(child: Container(color: Colors.red)),

            //Show only the item in a list can show in smartphone screen
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              //itemCount: 100,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final Message message = chatProvider.messages[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
                // return (index % 2 == 0)
                //     ? const MyMessageBubble()
                //     : const HerMessageBubble();
              },
            )),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
