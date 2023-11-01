import 'package:flutter/material.dart';

class TimeOutDialog extends StatefulWidget {
  const TimeOutDialog({super.key});

  @override
  State<TimeOutDialog> createState() => _TimeOutDialogState();
}

class _TimeOutDialogState extends State<TimeOutDialog> {
  Color _color = Colors.white;

  void _changeColor() {
    setState(() {
      _color = _color == Colors.white ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, //// Ngăn chặn việc đóng hộp thoại khi nhấn nút quay lại
      child: Stack(
        children: [
          GestureDetector(
            onTap:
                _changeColor, // Thay đổi màu sắc của hộp thoại khi người dùng nhấn vào ModalBarrier
            // child: const ModalBarrier(
            //   color: Colors.transparent, // Màu của ModalBarrier là trong suốt
            // ),
          ),
          Center(
            child: AnimatedContainer(
              duration: const Duration(
                  milliseconds: 500), // Thời gian của hiệu ứng nháy nháy
              //color: _color,
              child: AlertDialog(
                backgroundColor: _color, // Màu của hộp thoại
                title: const Text('Notice'),
                content: const Text('Time Out'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/start_screen');
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
