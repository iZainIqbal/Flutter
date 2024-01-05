// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});
  @override
  StatefulElement createElement() {
    print('UIUpdatesDemo CREATEELEMENT called');
    return super.createElement();
  }

  @override
  State<DemoButtons> createState() {
    return _DemoButtons();
  }
}

class _DemoButtons extends State<DemoButtons> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('UIUpdatesDemo BUILD called');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
