import 'package:flutter/material.dart';
import 'package:pocketbase_function/view/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Đăng Nhập',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _username,
                  onChanged: (value) {
                    setState(() {
                      value = _username.text;
                    });
                  },
                  decoration: const InputDecoration(hintText: 'Tài khoản'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
                  onChanged: (value) {
                    setState(() {
                      value = _password.text;
                    });
                  },
                  decoration: const InputDecoration(hintText: 'Mật khẩu'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<LoginProvider>().userLogin(
                          context: context,
                          username: _username.text,
                          password: _password.text);
                    },
                    child: const Text('Đăng nhập'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
