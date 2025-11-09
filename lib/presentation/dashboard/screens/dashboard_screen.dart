import 'package:dms_driver_app/data/data/location_remote_data_source.dart';
import 'package:dms_driver_app/data/repository/location_repository_impl.dart';
import 'package:dms_driver_app/domain/usecases/update_driver_location.dart';
import 'package:dms_driver_app/presentation/cubit/location_cubit.dart';
import 'package:dms_driver_app/presentation/dashboard/widget/dashboard_card.dart';
import 'package:dms_driver_app/presentation/common/widgets/greeting_text.dart';
import 'package:dms_driver_app/presentation/dashboard/widget/status_indicator.dart';
import 'package:dms_driver_app/presentation/dashboard/widget/dashboard_card.dart';
import 'package:dms_driver_app/presentation/common/widgets/greeting_text.dart';
import 'package:flutter/material.dart';
import 'package:dms_driver_app/services/location_service.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   bool isOnline = false;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       // backgroundColor: theme.colorScheme.background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Greeting
//               GreetingText(name: "Thilshan"),
//               SizedBox(height: 50),
//               // Status Indicator
//               Center(
//                 child: GestureDetector(
//                   onTap: () => setState(() => isOnline = !isOnline),
//                   child: StatusIndicator(isOnline: isOnline),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // Status Label
//               Center(
//                 child: Text(
//                   isOnline ? "Tap to go Offline" : "Tap to go Online",
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: isOnline
//                         ? Colors.blue.shade600
//                         : Colors.green.shade600,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

//               SizedBox(height: size.height * 0.04),

//               // Cards
//               Expanded(
//                 child: ListView(
//                   children: [
//                     const SizedBox(height: 40),

//                     DashboardCard(
//                       icon: Icons.add_circle_outline,
//                       title: "Add New Order",
//                       subtitle: "Add new completed order",
//                       onTap: () {},
//                     ),
//                     const SizedBox(height: 16),
//                     DashboardCard(
//                       icon: Icons.check_circle_outline,
//                       title: "Total Orders",
//                       subtitle: "From today 12 AM - 12 PM",
//                       trailingText: "11",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool isOnline = false;
  late AnimationController _controller;
  late Animation<double> _blinkAnimation;
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _blinkAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(_controller);
    _controller.stop(); // initially stopped (offline)
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleTracking() {
    setState(() {
      isOnline = !isOnline;
      if (isOnline) {
        _controller.repeat(reverse: true); // start blinking
        // TODO: Start location tracking here
        _locationService.startTracking(); // ✅ start location tracking
      } else {
        _controller.stop(); // stop blinking
        // TODO: Stop location tracking here
        _locationService.stopTracking(); // 🛑 stop tracking
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingText(name: "Thilshan"),
              const SizedBox(height: 50),

              //  Status Indicator (Blinking)
              Center(
                child: GestureDetector(
                  onTap: toggleTracking,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: isOnline ? _blinkAnimation.value : 1.0,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isOnline ? Colors.green : Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: (isOnline ? Colors.green : Colors.red)
                                    .withOpacity(0.5),
                                blurRadius: 12,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Label
              Center(
                child: Text(
                  isOnline ? "Tap to Stop Tracking" : "Tap to Start Tracking",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isOnline
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                    fontWeight: FontWeight.w600,
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
