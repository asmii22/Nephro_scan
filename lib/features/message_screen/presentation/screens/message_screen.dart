import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/message_screen/presentation/widgets/conversation_tile_widget.dart';
import 'package:nephroscan/features/message_screen/presentation/widgets/empty_conversation_widget.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // Static mock data for conversations
  // Set this to empty list to test empty state: final List<Map<String, dynamic>> _conversations = [];
  final List<Map<String, dynamic>> _conversations = [
    {
      'id': '1',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '2',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '3',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '4',
      'name': 'Dr. Robert Martinez',
      'lastMessage': 'The prescription has been sent to your pharmacy.',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatarUrl': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        title: 'Messages',
        rightWidget: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle search
          },
        ),
      ),
      body: _conversations.isEmpty
          ? const EmptyConversationWidget()
          : ListView.separated(
              itemCount: _conversations.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                indent: 72,
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.1),
              ),
              itemBuilder: (context, index) {
                final conversation = _conversations[index];
                return ConversationTileWidget(
                  name: conversation['name'],
                  lastMessage: conversation['lastMessage'],
                  time: conversation['time'],
                  unreadCount: conversation['unreadCount'],
                  avatarUrl: conversation['avatarUrl'],
                  onTap: () {
                    context.router.push(
                      ConversationRoute(
                        name: conversation['name'],
                        avatarUrl: conversation['avatarUrl'],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
