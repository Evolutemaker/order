import 'package:flutter/material.dart';
import 'package:order/routes/router_name.dart';
import 'package:order/widgets/buttons/default_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              title: 'Go to ordering',
              onPressed: () {
                Navigator.pushNamed(context, RouterName.orderingRoute);
              },
            ),
            const SizedBox(height: 32),
            DefaultButton(
              title: 'Add user',
              onPressed: () {
                Navigator.pushNamed(context, RouterName.addUserRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
