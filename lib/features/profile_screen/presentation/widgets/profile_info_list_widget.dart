import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

import '../../../sign_in_sign_up_screen/data/models/user_model/user_model.dart';

class ProfileInfoListWidget extends StatefulWidget {
  final Widget saveButton;
  final List<String>? initialValues; // [email, number, address]
  final UserModel? userModel;
  const ProfileInfoListWidget({
    super.key,
    required this.saveButton,
    this.initialValues,
    this.userModel,
  });

  @override
  _ProfileInfoListWidgetState createState() => _ProfileInfoListWidgetState();
}

class _ProfileInfoListWidgetState extends State<ProfileInfoListWidget> {
  final List<String> _labels = ['E-mail', 'Number', 'Address'];
  late final List<TextEditingController> _controllers;
  late final List<bool> _editing;

  @override
  void initState() {
    super.initState();
    final initials = widget.initialValues ?? ['', '', ''];
    _controllers = List.generate(
      3,
      (i) =>
          TextEditingController(text: i < initials.length ? initials[i] : ''),
    );
    _editing = List.generate(3, (_) => false);
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _toggleEditing(int index) {
    setState(() {
      if (_editing[index]) {
        // finishing edit -> dismiss keyboard
        FocusScope.of(context).unfocus();
      } else {
        // starting edit -> request focus later via UI
      }
      _editing[index] = !_editing[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (_, _) => Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
            ),
            itemCount: _labels.length,
            itemBuilder: (context, i) {
              final isEditing = _editing[i];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                title: Text(
                  _labels[i],
                  style: AppTextStyles.bodyLargePoppins.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                subtitle: isEditing
                    ? TextField(
                        controller: _controllers[i],
                        keyboardType: i == 0
                            ? TextInputType.emailAddress
                            : i == 1
                            ? TextInputType.phone
                            : TextInputType.multiline,
                        minLines: i == 2 ? 2 : 1,
                        maxLines: i == 2 ? null : 1,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (_) => _toggleEditing(i),
                      )
                    : Text(
                        i == 0
                            ? widget.userModel?.email ?? 'abc@gmail.com'
                            : i == 1
                            ? widget.userModel?.phoneNumber ?? '+1234567890'
                            : widget.userModel?.address ??
                                  '123, Main Street, City',

                        style: AppTextStyles.bodyMediumPoppins,
                      ),
                trailing: TextButton(
                  onPressed: () => _toggleEditing(i),
                  child: Text(
                    'Edit',
                    style: AppTextStyles.bodySmallInter.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onTertiary.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
