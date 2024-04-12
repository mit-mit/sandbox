import 'package:flutter/material.dart';

class HouseCardStandard extends StatelessWidget {
  const HouseCardStandard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffEBECF1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffE8F2F7),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xff7AC1E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
