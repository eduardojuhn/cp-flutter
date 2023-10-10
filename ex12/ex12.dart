import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      drawer: DrawerNavigation(),
      body: Center(
        child: Text('Tela Inicial'),
      ),
    );
  }
}

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Eduardo'),
            accountEmail: Text('rm93199@fiap.com.br'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/C4D03AQEnY_M2GBvfSw/profile-displayphoto-shrink_800_800/0/1657551516927?e=1702512000&v=beta&t=QENdQwa7A9Z16MLPBi8oNof6J7qy_47onqbXWMydows',
              ),
            ),
          ),
          ListTile(
            title: Text('Pessoal'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalTab(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Formação'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EducationTab(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Experiência'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExperienceTab(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: Eduardo Shimizu'),
            Text('Idade: 19 anos'),
          ],
        ),
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formação'),
      ),
      body: Center(
        child: Text(
            'Escolaridade: Graduação em andamento - Sistemas para Internet 2022-2023 FIAP'),
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiência'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Estagiário de desenvolvimento - 02/2023-10/2023 - GIC Brasil'),
            Text('Desenvolvedor Júnior - 10/2023 - o momento - GIC Brasil'),
          ],
        ),
      ),
    );
  }
}
