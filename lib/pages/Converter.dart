import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu(
                    label: Text('Unit'),
                    helperText: 'Select the unit of conversion',
                    enableSearch: false,

                    dropdownMenuEntries: <DropdownMenuEntry<int>>[
                      DropdownMenuEntry(value: 10, label: 'Area'),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
