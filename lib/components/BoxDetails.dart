import 'package:flutter/material.dart';

class box extends StatelessWidget {
  String title, text;
  box({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.02),
      ],
    );
  }
}
