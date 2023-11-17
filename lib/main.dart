import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'My Day Water!',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF71A7D8),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'assets/icon.png',
            height: 300,
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Bem Vindo ao MyDayWater!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF71A7D8),
                    fontSize: 16.0,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
                SizedBox(height: 32.0),
                  Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuantoTomeiScreen()),
                        );
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CadastroPage()),
                        );
                      },
                      child: Text('Cadastrar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Iniciando sua jornada no MyDayWater!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF71A7D8),
                fontSize: 20.0,
              ),
            ),
            Image.asset(
            'assets/icon.png',
            height: 300,
            ),
            SizedBox(height: 16.0),
            Text(
              'Nome de Usuário:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF71A7D8),
                fontSize: 16.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Defina a sua Senha:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF71A7D8),
                fontSize: 16.0,
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuantoTomeiScreen()),
                );
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantoTomeiScreen extends StatelessWidget {
  const QuantoTomeiScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDayWater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MyDayWater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _totalWaterIntake = 0;

  void _addWaterIntake(int amount) {
    setState(() {
      _totalWaterIntake += amount;
    });
  }

  Future<void> _showAddWaterDialog() async {
    TextEditingController _controller = TextEditingController();
    int _inputAmount = 0;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quanto tomei:'),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Valor em ml'),
            onChanged: (value) {
              _inputAmount = int.tryParse(value) ?? 0;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _addWaterIntake(_inputAmount);
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(189, 244, 250, 253).withOpacity(0.5), // Cor do menu transparente
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 110, 179, 236),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Quanto tomei'),
                onTap: () {
                  //Navigator.pop(context); // Fecha o Drawer antes de navegar
                  Navigator.push(
                  context,
                  MaterialPageRoute (builder: (context) => const QuantoTomeiScreen()),// Implementar ação para 'Quanto tomei'
                  );
                },
              ),
              
              ListTile(
                title: const Text('Quantidade ideal'),
                onTap: () {
                  // Implementar ação para 'Quantidade ideal'
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => MyApp2()),
                    );
                },
              ),
              ListTile(
                title: const Text('Meus Dados'),
                onTap: () {
                  // Implementar ação para 'Cadastro'
                  Navigator.pop(context);
                },
              ),
              const Divider(), // Divisor
              ListTile(
                title: const Text('Deslogar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => MyApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
       image: DecorationImage(
         image: AssetImage('imagens/fundo.png'), // Verifique se o caminho está correto
          fit: BoxFit.cover, // Ajuste o BoxFit conforme necessário
         ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/Icon2.png', // Caminho da imagem da gota de água
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                'Já tomei: $_totalWaterIntake (ml)',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddWaterDialog(),
        label: const Text('Adicionar Quantidade'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 79, 170, 245),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Água'),
        ),
        body: Center(
          child: WaterIntakeCalculator(),
        ),
      ),
    );
  }
}

class WaterIntakeCalculator extends StatefulWidget {
  @override
  _WaterIntakeCalculatorState createState() => _WaterIntakeCalculatorState();
}

class _WaterIntakeCalculatorState extends State<WaterIntakeCalculator> {
  TextEditingController weightController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Peso (kg)'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              calculateWaterIntake();
            },
            child: Text('Calcular'),
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void calculateWaterIntake() {
    if (weightController.text.isNotEmpty) {
      double weight = double.parse(weightController.text);
      double minIntake = weight * 25;
      double maxIntake = weight * 40;

      setState(() {
        result =
            'Você deve beber entre ${minIntake.toStringAsFixed(2)} ml e ${maxIntake.toStringAsFixed(2)} ml de água por dia.';
      });
    } else {
      setState(() {
        result = 'Por favor, insira seu peso:';
      });
    }
  }
}