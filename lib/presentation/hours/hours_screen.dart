import 'package:dms_driver_app/presentation/common/widgets/list_tile_widget.dart';
import 'package:dms_driver_app/presentation/common/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';

class HoursScreen extends StatefulWidget {
  const HoursScreen({super.key});

  @override
  State<HoursScreen> createState() => _HoursScreenState();
}

class _HoursScreenState extends State<HoursScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Working Hours")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(
              onSearchChanged: (query) {
                // Add your logic here (API call, filter list, etc.)
                debugPrint("Searching for: $query");
              },
            ),
            const SizedBox(height: 20),
            // Example content
            ListTileWidget(orderNo: '6 Hrs', date: '23 Nov 2025'),
            ListTileWidget(orderNo: '7 Hrs', date: '22 Nov 2025'),
            ListTileWidget(orderNo: '2 Hrs', date: '21 Nov 2025'),
            ListTileWidget(orderNo: '0 Hrs', date: '20 Nov 2025'),
          ],
        ),
      ),
      // body: ListTileWidget(orderNo: '435445435324', date: '23 Nov 2025'),
    );
  }
}
