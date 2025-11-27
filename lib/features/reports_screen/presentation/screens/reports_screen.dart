import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/reports_screen/presentation/widgets/single_report_widget.dart';

@RoutePage()
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(title: 'Reports'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: 3,
          itemBuilder: (context, index) => SingleReportWidget(),
          separatorBuilder: (BuildContext context, int index) {
            return 14.verticalBox;
          },
        ),
      ),
    );
  }
}
