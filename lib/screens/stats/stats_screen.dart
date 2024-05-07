import 'package:expense_tracker/screens/stats/chart.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          children: [
            const Text(
              'Transaction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const MyChart())
          ],
        ),
      ),
    );
  }
}
