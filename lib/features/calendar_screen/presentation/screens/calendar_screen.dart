import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

import '../../../../base/app_common_widget/custom_top_nav_bar/user_avatar_widget.dart';
import '../widgets/single_appointment_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, this.username, this.email});
  final String? username;
  final String? email;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        leftWidget: SizedBox.shrink(),
        title: 'My Appointment',
        rightWidget: UserAvatarWidget(
          username: widget.username,
          email: widget.email,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SingleAppointmentScreen();
        },
      ),
    );
  }
}
