import 'package:covid19/constants.dart';
import 'package:covid19/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
    required this.image,
    required this.texttop,
    required this.textbottom,
  });
  final String image, texttop, textbottom;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/virus.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(),
                    ),
                  );
                },
                child: SvgPicture.asset('assets/icons/menu.svg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SvgPicture.asset(
                  image,
                  // width: 230,
                  fit: BoxFit.fitWidth,
                  // alignment: Alignment.topCenter,
                ),
                Positioned(
                  top: 20,
                  left: 150,
                  child: Text(
                    '$texttop\n$textbottom',
                    style: kHeadingTextStyle.copyWith(color: Colors.white),
                  ),
                ),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
