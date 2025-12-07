import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/reports_screen/presentation/widgets/single_report_widget.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../cubit/reports_cubit/reports_cubit.dart';

@RoutePage()
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key, this.reportIds});
  final List<String>? reportIds;

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReportsCubit>().getReportsByIds(widget.reportIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(title: 'Reports'),
      body: BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(color: AppColors.appearance),
            ),
            success: (data) {
              if (data == null || data.isEmpty) {
                return Center(
                  child: Text(
                    'No Reports Available',
                    style: AppTextStyles.titleMediumPoppins,
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) => SingleReportWidget(
                    date: data[index].date,
                    reportDescription: data[index].findings,
                    reportTitle: data[index].title,
                    onTap: () {
                      context.router.push(
                        SingleReportRoute(report: data[index]),
                      );
                    },
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return 14.verticalBox;
                  },
                ),
              );
            },
            error: (message) {
              return Center(child: Text('Error: $message'));
            },
          );
        },
      ),
    );
  }
}
