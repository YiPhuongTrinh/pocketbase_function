import 'package:flutter/material.dart';
import 'package:pocketbase_function/model/user_repository.dart';
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
                    style: Theme.of(context).textTheme.headlineSmall),
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
                  decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Vui lòng nhập tài khoản',
                      labelText: 'Tên đăng nhập'),
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
                  decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Vui lòng nhập mật khẩu',
                      labelText: 'Mật khẩu'),
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
                    child: const Text('Đăng nhập')),
                ElevatedButton(
                    onPressed: () {
                      print(pb.authStore.isValid);
                    },
                    child: const Text('Check'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
