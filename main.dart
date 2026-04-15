import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // controller username
  final TextEditingController _usernameController = TextEditingController();

  // controller password (tambahan)
  final TextEditingController _passwordController = TextEditingController();

  void LoginPage() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Berhasil: $username / $password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 207, 188, 14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // USERNAME
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username wajib diisi';
                  } else if (value.length < 4) {
                    return 'Username harus minimal 4 karakter';
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),

              // PASSWORD 
              TextFormField(
                controller: _passwordController,
                obscureText: true, // agar password tersembunyi
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password wajib diisi';
                  } else if (value.length < 4) {
                    return 'Password harus minimal 4 karakter';
                  }
                  return null;
                },
                
              ),

              SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Login berhasil ${_usernameController.text}, ${_passwordController.text}',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}