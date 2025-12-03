import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

class EmptyConversationWidget extends StatelessWidget {
  const EmptyConversationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 100,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          ),
          16.verticalBox,
          Text(
            'No Conversations Yet',
            style: AppTextStyles.titleMediumPoppins.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          8.verticalBox,
          Text(
            'Start a conversation with a doctor',
            style: AppTextStyles.bodyMediumPoppins.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
