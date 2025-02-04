import 'package:flutter/material.dart';

class TextLongResumeComponent extends StatelessWidget {
  const TextLongResumeComponent({
    this.title,
    this.subtitle,
    super.key,
  });
  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
              textAlign: TextAlign.start,
            ),
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
      ),
    );
  }
}
