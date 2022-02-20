import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
/// Chat screen template. This is your starting point.
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

      body: FutureBuilder<List<ChatMessageDto>>(
        future: widget.chatRepository.messages,
        builder: (BuildContext context, AsyncSnapshot<List<ChatMessageDto>> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_,index) => MessageCard(message: snapshot.data![index]) // Fix null
            );
          } else if (snapshot.hasError) {
              child = Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              );
          } else {
            child = Column(
              children: const [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ],
            );
          }
          return child;
        },
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

class MessageCard extends StatelessWidget {

  final ChatMessageDto message;

  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(message.author.name[0]),
        ),
        title: Text(message.author.name),
        subtitle: Text(message.message),
      ),
    );
  }
}
