// features/home/presentation/views/widgets/preview_section.dart
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/stayles.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 48,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: Center(
            child: Text(
              'Free',
              style: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse(book.previewLink!.toString());
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
          child: Container(
            width: 150,
            height: 48,
            decoration: const BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Center(
              child: Text(
                'Free preview',
                style: Styles.textStyle16.copyWith(fontFamily: 'Gilroy-Bold'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
