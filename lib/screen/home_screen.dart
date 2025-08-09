import 'package:flutter/cupertino.dart';
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

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다. 오늘 점심은 맛있었다.오늘 점심은 맛있었다.'),
  FeedData(userName: 'User2', likeCount: 24, content: '오늘 아침은 맛있었다.'),
  FeedData(userName: 'User3', likeCount: 82, content: '오늘 간식은 맛있었다.'),
  FeedData(userName: 'User4', likeCount: 92, content: '어제 점심은 맛있었다.'),
  FeedData(userName: 'User5', likeCount: 34, content: '놀러 가고 싶다.'),
  FeedData(userName: 'User6', likeCount: 16, content: '이번 여름 휴가는 어디로 가지?'),
  FeedData(userName: 'User7', likeCount: 3, content: '일본 여행 하고 싶다.'),
  FeedData(userName: 'User8', likeCount: 67, content: '오늘도 열심히 일하는 나'),
  FeedData(userName: 'User9', likeCount: 63, content: 'Flutter는 재밌다.'),
  FeedData(userName: 'User10', likeCount: 26, content: '퇴사하고 싶다.'),
  FeedData(userName: 'User11', likeCount: 43, content: '이번 여름 휴가는 울산으로'),
  FeedData(userName: 'User12', likeCount: 16, content: '9월에 이사한다.'),
  FeedData(userName: 'User13', likeCount: 45, content: '오늘 저녁은 뭐 먹지?'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.chat_bubble),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.paperplane),
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: feedData.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: feedData.content),
              ],
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 8,),
      ],
    );
  }
}
