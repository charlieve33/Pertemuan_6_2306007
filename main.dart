import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halaman Login',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, 
          foregroundColor: Colors.white, 
        ),
      ),
      home: const LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  // GlobalKey untuk validasi form (Langkah 7 & 10)
  final _formKey = GlobalKey<FormState>();


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi Login
  void login() {
    if (_formKey.currentState!.validate()) {
      String username = usernameController.text;

      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: username),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    /// Scaffold dengan AppBar Biru
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Login"), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), 
        /// Properti Key pada Widget Form
        child: Form(
          key: _formKey,
          child: Column(
            children: [
            
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                // Validator: Wajib diisi & Minimal 4 karakter
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username wajib diisi";
                  } else if (value.length < 4) {
                    return "Username minimal 4 huruf"; 
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // TextFormField untuk Password
              TextFormField(
                controller: passwordController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                // Validator: Wajib diisi & Minimal 4 karakter
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password wajib diisi";
                  } else if (value.length < 4) {
                    return "Password minimal 4 huruf"; 
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              
              ElevatedButton(
                onPressed: login,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}