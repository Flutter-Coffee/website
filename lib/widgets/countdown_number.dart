import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownNumber extends StatelessWidget {

  final String subtitle;
  final String number;

  const CountdownNumber({Key key, @required this.number, @required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(200))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.number, style: GoogleFonts.roboto(
            fontSize: 80,
            fontWeight: FontWeight.w100
          )),
          Text(this.subtitle, style: GoogleFonts.roboto(fontSize: 16,
            fontWeight: FontWeight.bold
          ))
        ],
      ),
    );
  }
}
