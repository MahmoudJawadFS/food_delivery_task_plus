import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class CounterWidget extends StatefulWidget {
  static int c = 1;
  final ValueChanged<int>? onCounterChanged;

  const CounterWidget({super.key, this.onCounterChanged});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = CounterWidget.c;

  void _updateCounter(int newCounter) {
    setState(() {
      _counter = newCounter;
      CounterWidget.c = _counter;
      if (widget.onCounterChanged != null) {
        widget.onCounterChanged!(_counter);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = CounterWidget.c = 1;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _counter > 1 ? () => _updateCounter(_counter - 1) : null,
          ),
          const SizedBox(width: 8),
          Text(_counter.toString()),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _updateCounter(_counter + 1),
          ),
        ],
      ),
    );
  }
}
