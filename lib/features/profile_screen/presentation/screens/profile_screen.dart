import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/core/injection/injection.dart';
import 'package:nephroscan/features/profile_screen/presentation/cubits/get_all_reports_cubit/get_all_reports_cubit.dart';
import 'package:nephroscan/features/profile_screen/presentation/widgets/profile_container_widget.dart';
import 'package:nephroscan/features/profile_screen/presentation/widgets/profile_info_list_widget.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.userModel});
  final UserModel? userModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GetAllReportsCubit _getAllReportsCubit;
  @override
  void initState() {
    super.initState();
    _getAllReportsCubit = getIt<GetAllReportsCubit>();
    if (widget.userModel?.role == UserRole.doctor) {
      _getAllReportsCubit.getAllReports();
    }
  }

  @override
  void dispose() {
    _getAllReportsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: height * 0.35,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSecondary.withValues(alpha: 0.35),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalBox,
                  Text(
                    'Profile Screen',
                    style: AppTextStyles.headlineMediumPoppins,
                  ),
                  20.verticalBox,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset(PNGImages.dummy),
                            ),
                          ),
                          10.verticalBox,
                          Text(
                            widget.userModel?.name ?? 'John Doe',
                            style: AppTextStyles.titleLargeMontserrat,
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.verticalBox,
                  if (widget.userModel?.role == UserRole.doctor)
                    BlocBuilder<GetAllReportsCubit, GetAllReportsState>(
                      bloc: _getAllReportsCubit,
                      builder: (context, state) {
                        final reports = state.maybeWhen(
                          allReports: (reports) => reports,
                          orElse: () => null,
                        );

                        return ProfileContainerWidget(
                          reportsCount: reports?.length,
                          onTap: () {
                            context.router.push(
                              ReportsRoute(reportIds: reports),
                            );
                          },
                        );
                      },
                    ),
                  if (widget.userModel?.role == UserRole.patient)
                    ProfileContainerWidget(
                      reportsCount: widget.userModel?.reports?.length,
                      onTap: () {
                        context.router.push(
                          ReportsRoute(reportIds: widget.userModel?.reports),
                        );
                      },
                    ),
                  20.verticalBox,
                  Expanded(
                    child: ProfileInfoListWidget(
                      userModel: widget.userModel,
                      saveButton: SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: width * 0.4,
            right: width * 0.4,
            child: AppButton(radius: 50, title: 'Save', onClick: () {}),
          ),
        ],
      ),
    );
  }
}
