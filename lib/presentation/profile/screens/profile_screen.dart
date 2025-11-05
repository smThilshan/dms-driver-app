import 'package:dms_driver_app/presentation/profile/widget/avatar_widget.dart';
import 'package:dms_driver_app/presentation/profile/widget/profile_textfield.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   selectedItemColor: theme.primaryColor,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list_alt_outlined),
      //       label: "My Orders",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.access_time),
      //       label: "Hours",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(child: AvatarWidget(imageUrl: null)),
            const SizedBox(height: 30),

            Text("Personal Details", style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            const ProfileTextField(label: "Username", value: "thilshan-20"),
            const ProfileTextField(
              label: "Password",
              value: "**********",
              obscure: true,
            ),

            const Divider(height: 40),
            Text("Bank Account Details", style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            const ProfileTextField(
              label: "Bank Account Number",
              value: "204356XXXXXXX",
            ),
            const ProfileTextField(
              label: "Account Holder’s Name",
              value: "Abhiraj Sisodiya",
            ),
            const ProfileTextField(
              label: "IFSC Code",
              value: "SBIN00428",
              borderHighlight: true,
            ),
          ],
        ),
      ),
    );
  }
}
