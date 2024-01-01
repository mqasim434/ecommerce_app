import 'package:flutter/material.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({
    super.key,
    required this.image,
    required this.label,
    required this.onPress,
  });

  final String image;
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: onPress,
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff354633)),
              ),
              child: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
