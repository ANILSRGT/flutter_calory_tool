import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ServingFilterSheet extends StatefulWidget {
  const ServingFilterSheet({super.key});

  @override
  State<ServingFilterSheet> createState() => _ServingFilterSheetState();
}

class _ServingFilterSheetState extends State<ServingFilterSheet> {
  final _filters = <String, bool>{'a': false, 'b': false};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._filters.entries.map(
            (e) => Row(
              children: [
                Checkbox(
                  value: e.value,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == null) return;
                      _filters[e.key] = value;
                    });
                  },
                ),
                const Text('Filter Option 1'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context.router.popForced();
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
