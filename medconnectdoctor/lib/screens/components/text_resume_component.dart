import 'package:flutter/material.dart';

class TextResumeComponent extends StatelessWidget {
  const TextResumeComponent({
    this.title,
    this.subtitle,
    super.key,
  });
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            subtitle!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}