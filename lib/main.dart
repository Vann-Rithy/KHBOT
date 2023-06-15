import 'package:flutter/material.dart';
import './telegram_bot_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botApi =
        TelegramBotApi('5808032935:AAGtuoUiMXUI47pgctOzu86htyQsFIaNH4s');
    final chatId = '5110093561';
    final messageController = TextEditingController();
    Future<void> sendMessage(String message) async {
      try {
        final response = await botApi.sendMessage(chatId, message);
        // print('Message sent with message_id: ${response.messageId}');
      } catch (e) {
        print('Error sending message: ${e.toString()}');
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Telegram Bot API Example',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Flutter Telegram Bot API')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 100,
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a message',
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => sendMessage(messageController.text),
                child: Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
