import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

@RoutePage()
class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Check if user is logged in
        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in, navigate to Dashboard
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.router.replace(const DashboardRoute());
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User is not logged in, navigate to Sign In
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.router.replace(const OnboardingRoute());
        });
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
