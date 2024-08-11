import 'package:flutter/material.dart';
import 'package:yes_no_app_chat/domain/entities/messages.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //Search all list of color defined on config/theme
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // child: Text(
            //   'Cupidatat esse velit veniam.',
            //   style: TextStyle(color: Colors.yellow),
            // ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.yellow),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
