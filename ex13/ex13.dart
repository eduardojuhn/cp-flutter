import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    PersonalTab(),
    EducationTab(),
    ExperienceTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pessoal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experiência',
          ),
        ],
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/C4D03AQEnY_M2GBvfSw/profile-displayphoto-shrink_800_800/0/1657551516927?e=1702512000&v=beta&t=QENdQwa7A9Z16MLPBi8oNof6J7qy_47onqbXWMydows',
            ),
          ),
          SizedBox(height: 20),
          Text('Nome: Eduardo Shimizu'),
          Text('Idade: 19 anos'),
        ],
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Escolaridade: Graduação em andamento - Sistemas para Internet 2022-2023 FIAP',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Estagiário de desenvolvimento - 02/2023 - 10/2023 - GIC Brasil'),
          Text('Desenvolvedor Júnior - 10/2023-atual - GIC Brasil'),
        ],
      ),
    );
  }
}
