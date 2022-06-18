import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';

class ProfileWidget extends StatelessWidget {
  final String avatarImage;
  final VoidCallback onClicked;
  final double widthImage;
  final double heightImage;

  const ProfileWidget(
      {Key? key,
      required this.avatarImage,
      required this.onClicked,
      required this.heightImage,
      required this.widthImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = NowUIColors.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          //Positioned(bottom: 0, right: 4, child: buildEditIcon(color)),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(avatarImage);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: widthImage,
          height: heightImage,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      child: Icon(
        Icons.edit,
        color: NowUIColors.white,
        size: 20,
      ),
      all: 8,
      color: color);

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
