import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    //Manage the input behaviour data

    final textController = TextEditingController();

    //Manage the app focus, for mantained focus
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    ///There are many InputDecorator other example in
    ///attribute enabledBoder is
    ///OutlineInputBorder(
    //   borderSide: BorderSide(color: color.primary),
    //   borderRadius: BorderRadius.circular(20))

    final inputDecoration = InputDecoration(
        hintText: 'End your message with ??',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('Valor de la caja de texto');
            textController.clear();
            onValue(textValue);
          },
        ));

    return TextFormField(
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        print("Submit value is $value");
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      // onChanged: (value) {
      //   print("Changed value is $value");
      // },
      onTapOutside: (event) {
        //Change focus when tap or click out the form
        focusNode.unfocus();
      },
    );
  }
}
