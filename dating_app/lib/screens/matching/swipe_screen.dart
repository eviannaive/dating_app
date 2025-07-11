
import 'package:flutter/material.dart';
import 'package:dating_app/models/ai_character.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  // Mock data for AI characters
  final List<AICharacter> _characters = [
    AICharacter(name: 'Alex', age: 28, bio: 'Loves hiking and reading.', imageUrl: 'https://picsum.photos/id/237/300/300'),
    AICharacter(name: 'Ben', age: 32, bio: 'Enjoys cooking and movies.', imageUrl: 'https://picsum.photos/id/238/300/300'),
    AICharacter(name: 'Charlie', age: 25, bio: 'Passionate about music and art.', imageUrl: 'https://picsum.photos/id/239/300/300'),
    AICharacter(name: 'David', age: 35, bio: 'Loves to travel and explore.', imageUrl: 'https://picsum.photos/id/240/300/300'),
    AICharacter(name: 'Eve', age: 29, bio: 'A foodie and a bookworm.', imageUrl: 'https://picsum.photos/id/241/300/300'),
  ];

  int _currentIndex = 0;

  void _nextCharacter() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _characters.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Match'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink[200]!,
              Colors.purple[400]!,
            ],
          ),
        ),
        child: Center(
          child: _characters.isNotEmpty
              ? Draggable(
                  feedback: _buildCharacterCard(_characters[_currentIndex]),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dx > 0) {
                      // Swiped right (like)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Liked!')),
                      );
                      _nextCharacter();
                    } else if (details.velocity.pixelsPerSecond.dx < 0) {
                      // Swiped left (dislike)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Disliked')),
                      );
                      _nextCharacter();
                    }
                  },
                  child: _buildCharacterCard(_characters[_currentIndex]),
                )
              : const Text('No more characters', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildCharacterCard(AICharacter character) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              character.imageUrl,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${character.name}, ${character.age}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(character.bio),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
