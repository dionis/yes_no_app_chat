import 'package:flutter/material.dart';
import 'package:yes_no_app_chat/domain/entities/messages.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //Search all list of color defined on config/theme
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          urlImage: message.imageUrl ?? "",
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;

  const _ImageBubble({required this.urlImage});

  @override
  Widget build(BuildContext context) {
    //To Know the device dimentions
    //MediaQuery give us about size and diferent features of current device
    final size = MediaQuery.of(context).size;

    //The PlaceHolder witget help to show the default dimension assigned
    //return const Placeholder();

    //The ClipRRect's witdget allows you to make rounded edges
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        (urlImage != "")
            ? urlImage
            : 'https://yesno.wtf/assets/no/17-829284e9dd894ce9fb65fbe86d2e382c.gif',
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          //Show message waiting for images
          //Important for show inter download image or other documents

          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.5,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CircularProgressIndicator(
              value: (loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null),
            ),
          );
        },
      ),
    );
  }
}
