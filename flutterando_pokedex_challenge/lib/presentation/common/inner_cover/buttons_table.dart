import 'package:flutter/material.dart';

class ButtonsTable extends StatelessWidget {
  const ButtonsTable({@required this.buttonsCallback})
      : assert(buttonsCallback != null && buttonsCallback.length == 10);

  final List<VoidCallback> buttonsCallback;

  @override
  Widget build(BuildContext context) => Table(
        border: TableBorder.all(
          color: Colors.black,
          width: 1.5,
        ),
        children: [
          TableRow(
            children: [
              _TableButton(
                onTap: buttonsCallback[0],
              ),
              _TableButton(
                onTap: buttonsCallback[1],
              ),
              _TableButton(
                onTap: buttonsCallback[2],
              ),
              _TableButton(
                onTap: buttonsCallback[3],
              ),
              _TableButton(
                onTap: buttonsCallback[4],
              ),
            ],
          ),
          TableRow(
            children: [
              _TableButton(
                onTap: buttonsCallback[5],
              ),
              _TableButton(
                onTap: buttonsCallback[6],
              ),
              _TableButton(
                onTap: buttonsCallback[7],
              ),
              _TableButton(
                onTap: buttonsCallback[8],
              ),
              _TableButton(
                onTap: buttonsCallback[9],
              ),
            ],
          ),
        ],
      );
}

class _TableButton extends StatelessWidget {
  const _TableButton({@required this.onTap}) : assert(onTap != null);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _size.height / 12,
        color: Colors.lightBlue,
      ),
    );
  }
}
