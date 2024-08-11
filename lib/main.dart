import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app_chat/config/theme/app_theme.dart';
import 'package:yes_no_app_chat/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_chat/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Define the Provider with the more importar Providers

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
