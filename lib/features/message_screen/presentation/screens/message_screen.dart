import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/message_screen/presentation/widgets/conversation_tile_widget.dart';
import 'package:nephroscan/features/message_screen/presentation/widgets/empty_conversation_widget.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String _searchText = '';

  String? _searchValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter search text';
    }
    return null;
  }

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
    {
      'id': '5',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '6',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '7',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '8',
      'name': 'Dr. Robert Martinez',
      'lastMessage': 'The prescription has been sent to your pharmacy.',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '9',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '21',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '32',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '43',
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
      resizeToAvoidBottomInset: false,
      appBar: CustomTopNavBar(
        title: 'Messages',
        leftWidget: SizedBox.shrink(),
        rightWidget: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle search
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: AppTextField.textField(
                context: context,
                name: 'search',
                hint: 'Search messages',
                prefixIcon: const Icon(Icons.search),
                autocorrect: false,
                validator: _searchValidator,
                onTextChanged: (value) {
                  setState(() {
                    _searchText = value ?? '';
                  });
                },
              ),
            ),
            if (_searchText.trim().isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.all(10),
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text('Search Result ${index + 1}'),
                      subtitle: Text('Tap to view conversation'),
                      onTap: () {
                        // Handle search result tap
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: _conversations.isEmpty
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
            ),
          ],
        ),
      ),
    );
  }
}
