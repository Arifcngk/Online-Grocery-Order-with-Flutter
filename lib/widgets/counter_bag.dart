import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final bool theme;

  const Counter({Key? key, required this.theme}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _decrementCounter,
          icon: Icon(
            Icons.remove,
            color: widget.theme ? Colors.white : Colors.black,
            size: 16,
          ),
        ),
        Text(
          '$_counter',
          style: TextStyle(
            color: widget.theme ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: _incrementCounter,
          icon: Icon(
            Icons.add,
            color: widget.theme ? Colors.white : Colors.black,
            size: 16,
          ),
        ),
      ],
    );
  }
}
