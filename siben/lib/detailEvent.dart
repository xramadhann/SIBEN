// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:siben/viewmodels/museumTitle.dart';

class DetailEvent extends StatefulWidget {
  const DetailEvent({Key? key, required this.museum}) : super(key: key);
  final Museum museum;

  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  String _currentSubtitle = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.museum.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              widget.museum.assetImagePath,
              height: 20,
            ),
          ),
          Text(
            _currentSubtitle.isNotEmpty
                ? _currentSubtitle
                : widget.museum.subtitle,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentSubtitle = widget.museum.subtitle;
                  });
                },
                child: const Text('ind'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentSubtitle = widget.museum.subtitle2;
                  });
                },
                child: const Text('eng'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentSubtitle = widget.museum.subtitle3;
                  });
                },
                child: const Text('mnd'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
