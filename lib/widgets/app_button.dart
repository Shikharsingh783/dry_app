import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String txtData;
  final void Function()? ontap;

  const AppButton({
    super.key,
    required this.txtData,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 64,
        width: 134,
        decoration: BoxDecoration(
          color: const Color(0XFF00FF19),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            txtData,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
