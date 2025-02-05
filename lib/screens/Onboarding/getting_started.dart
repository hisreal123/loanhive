import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboarding/get_started.png',
                height: 300),
            SizedBox(height: 20),
            Text(
              "Fast Approval & Disbursement",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "Apply, Approve, Recieve - Simplicity guaranteed.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => GettingStarted()),
            //     );
            //   },
            //   child: Text('Get Started'),
            // ),
          ],
        ),
      ),
    );
  }
}
