import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SpinKitFadingCube(
              size: 150,
              itemBuilder: (context, index) {
                final colors = [
                  const Color(0xff125B50),
                  const Color(0xff46244C),
                  const Color(0xff5F7464),
                  const Color(0xff1C658C),
                ];
                final color = colors[index % colors.length];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: MediaQuery.of(context).size.width,
                          offset: const Offset(4, 8), // Shadow position
                        ),
                      ],
                    // shape: BoxShape.circle,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
