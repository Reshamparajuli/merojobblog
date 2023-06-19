// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiServices implements Abc {
  int i = 0;
  Future<void> login() async {}

  @override
  Future<String> abc() {
    throw UnimplementedError();
  }
}

abstract class Abc {
  Future<String> abc() async {
    return "Hello";
  }
}

class FormVIewMOdel extends ChangeNotifier {
  final TextEditingController formController = TextEditingController();
  final ApiServices apiServices;
  FormVIewMOdel({required this.apiServices});

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  Future<bool> login(String firstName) async {
    apiServices.login();
    return false;
  }
}



class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  int a = 5;
  @override
  Widget build(BuildContext context) {
    Widget _abc() {
      return Text(a.toString());
    }

    return ChangeNotifierProvider<FormVIewMOdel>(
      create: (context) => FormVIewMOdel(apiServices: ApiServices()),
      builder: (context, child) => Column(
        children: [
          TextFormField(
            controller: context.read<FormVIewMOdel>().formController,
          ),
          ElevatedButton(
              onPressed: () {
                ////.....
                ///...
                if (!context.mounted) return;

              },
              // onPressed: () => context.read<FormVIewMOdel>().login(),
              child: const Text("Login")),
          _abc(),
        ],
      ),
    );
  }
}

class Abcd extends StatelessWidget {
  const Abcd({super.key, required this.value});
  final int value;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
