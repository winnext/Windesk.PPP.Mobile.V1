import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
      child: const Align(alignment: Alignment.center, child: CircularProgressIndicator(backgroundColor: Colors.transparent,)),
    );
  }
}
