import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideAnimationText extends StatelessWidget {
  const SlideAnimationText({super.key, required this.slideAnimation});
final Animation<Offset> slideAnimation;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slideAnimation,
                child: Text('Read more, discover more',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.padyakkeExpandedOne()),
              );
            });
  }
}