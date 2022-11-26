import 'package:flutter/material.dart';
import 'package:real_project/app/modules/authentication/authentication.dart';

class RedirectView extends StatelessWidget {
  final AuthenticationController _authenticationController =
      AuthenticationController.findAuthCont;
   RedirectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RedirectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RedirectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
