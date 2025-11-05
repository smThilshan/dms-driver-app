import 'package:dms_driver_app/presentation/common/widgets/list_tile_widget.dart';
import 'package:dms_driver_app/presentation/common/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
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
            ListTileWidget(orderNo: '435445435324', date: '23 Nov 2025'),
            ListTileWidget(orderNo: '454534434645', date: '22 Nov 2025'),
            ListTileWidget(orderNo: '453454534545', date: '20 Nov 2025'),
            ListTileWidget(orderNo: '675754676868', date: '23 Nov 2025'),
            ListTileWidget(orderNo: '979067076996', date: '23 Nov 2025'),
            ListTileWidget(orderNo: '967097664566', date: '23 Nov 2025'),
            ListTileWidget(orderNo: '486587436466', date: '23 Nov 2025'),
          ],
        ),
      ),
      // body: ListTileWidget(orderNo: '435445435324', date: '23 Nov 2025'),
    );
  }
}
