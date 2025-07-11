import 'package:flutter/material.dart';
import 'package:dating_app/models/chat_room.dart';
import 'package:dating_app/screens/chat/chat_room_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  // Mock data for chat rooms
  final List<ChatRoom> _chatRooms = const [
    ChatRoom(id: '1', characterName: 'Alex', lastMessage: 'Hey, how are you?', imageUrl: 'https://picsum.photos/id/237/150/150'),
    ChatRoom(id: '2', characterName: 'Ben', lastMessage: 'Did you see that movie?', imageUrl: 'https://picsum.photos/id/238/150/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: _chatRooms.length,
        itemBuilder: (context, index) {
          final chatRoom = _chatRooms[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chatRoom.imageUrl),
            ),
            title: Text(chatRoom.characterName),
            subtitle: Text(chatRoom.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoomScreen(chatRoom: chatRoom),
                ),
              );
            },
          );
        },
      ),
    );
  }
}