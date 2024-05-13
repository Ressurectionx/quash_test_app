// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quash_watch/quash_watch.dart';
import 'package:quash_watch/utils/quash_utils.dart';
import 'package:intl/intl.dart';

import '../../controller/app_crash_controller.dart';
import '../../utils/helpers.dart';

class AppCrashScreen extends StatefulWidget {
  const AppCrashScreen({Key? key}) : super(key: key);

  @override
  State<AppCrashScreen> createState() => _AppCrashScreenState();
}

class _AppCrashScreenState extends State<AppCrashScreen> {
  AppCrashController appCrashController = AppCrashController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Crash Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              appCrashController.throwRandomException();

              setState(() {});
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red)),
              child: const Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min, // Adjusts width to content
                children: [
                  Text(
                    'Crash The App',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<LogEntry>>(
              future: appCrashController.loadErrorLogsAsCrashData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<LogEntry> logs = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: logs.length,
                    itemBuilder: (context, index) {
                      final LogEntry crashData = logs[index];
                      return ListTile(
                        leading: Icon(
                          Icons.bug_report,
                          color: getColorFromSeverity(crashData.severity),
                        ), // Add bug report icon at leading
                        trailing: Text(
                          crashData.severity.toString().split('.').last,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getColorFromSeverity(crashData.severity)),
                        ), // Show severity with bold and color
                        title: Text(
                          crashData.message.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ), // Bold title
                        subtitle: Text(
                          DateFormat('dd/MM/yy hh:mm')
                              .format(crashData.timeStamp),
                        ), // Show time and date in format dd/MM/yy hh:mm
                        // ... other UI elements using crashData properties
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
