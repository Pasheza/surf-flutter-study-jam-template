import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatScreen({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO(task): Use ChatRepository to implement the chat.
    return Scaffold(
      appBar: AppBar(
        title : const TextField(
          decoration: InputDecoration(
            hintText: 'Введите ник',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card();
          }
      ),
      
      
      
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Expanded(
              child:TextField(
                  decoration: InputDecoration(
                hintText: 'Сообщение',
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send)
            ),
          ],
        ),
      ),
    );
  }
}
