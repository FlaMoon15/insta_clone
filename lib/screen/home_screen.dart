import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [const StoryArea(), FeedList()]),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => UserStory(storyUserName: 'User $index'),
        ),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String storyUserName;

  const UserStory({required this.storyUserName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(storyUserName),
        ],
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
