import 'package:dms_driver_app/presentation/dashboard/widget/dashboard_card.dart';
import 'package:dms_driver_app/presentation/common/widgets/greeting_text.dart';
import 'package:dms_driver_app/presentation/dashboard/widget/status_indicator.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              GreetingText(name: "Thilshan"),
              SizedBox(height: 50),
              // Status Indicator
              Center(
                child: GestureDetector(
                  onTap: () => setState(() => isOnline = !isOnline),
                  child: StatusIndicator(isOnline: isOnline),
                ),
              ),

              const SizedBox(height: 16),

              // Status Label
              Center(
                child: Text(
                  isOnline ? "Tap to go Offline" : "Tap to go Online",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isOnline
                        ? Colors.blue.shade600
                        : Colors.green.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.04),

              // Cards
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 40),

                    DashboardCard(
                      icon: Icons.add_circle_outline,
                      title: "Add New Order",
                      subtitle: "Add new completed order",
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    DashboardCard(
                      icon: Icons.check_circle_outline,
                      title: "Total Orders",
                      subtitle: "From today 12 AM - 12 PM",
                      trailingText: "11",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
