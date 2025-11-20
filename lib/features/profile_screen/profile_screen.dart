import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/profile_screen/widgets/profile_container_widget.dart';
import 'package:nephroscan/features/profile_screen/widgets/profile_info_list_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                            'John Doe',
                            style: AppTextStyles.titleLargeMontserrat,
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.verticalBox,
                  ProfileContainerWidget(),
                  20.verticalBox,
                  Expanded(
                    child: ProfileInfoListWidget(saveButton: SizedBox()),
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
