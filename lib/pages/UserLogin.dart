import 'package:flutter/material.dart';
import 'package:naomi_elibrary/pages/librarianHome.dart';
import 'package:naomi_elibrary/pages/registration.dart';
import 'userHome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var roleController = TextEditingController();

  bool _isPasswordVisible = false; // Add a state variable to track visibility

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;
    String role = roleController.text;

    if (username == 'Sara' && password == 'sara'&& role=='0') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    else if (username == 'Naomi' && password == 'naomi'&& role=='1') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LibHomePage()),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLogo(),
              const SizedBox(height: 50),
              _buildUsernameField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              _buildRoleField(),
              const SizedBox(height: 20),
              _buildSignUpButton(),
              const SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/nssf.png'),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Username',
        suffixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      obscureText: !_isPasswordVisible, // Toggle obscureText based on visibility
    );
  }

  Widget _buildRoleField() {
    return TextField(
      controller: roleController,
      decoration: InputDecoration(
        labelText: 'Role',
        hintText: '0-user , 1-librarian',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Do not have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrationPage()),
            );
          },
          child: const Text(' Register Here'),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton.icon(
      onPressed: _login,
      icon: const Icon(Icons.login),
      label: const Text('Login'),
      style: ElevatedButton.styleFrom(
        foregroundColor: chocolateColor,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    roleController.dispose();
    super.dispose();
  }
}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);


