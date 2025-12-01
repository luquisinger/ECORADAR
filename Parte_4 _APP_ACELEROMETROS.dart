import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(EcoradarApp());
}

class EcoradarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecoradar',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis para armazenar os dados do acelerômetro
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  @override
  void initState() {
    super.initState();
    // Iniciar a escuta do acelerômetro
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecoradar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/ecoradar.PNG', // Caminho da imagem
              height: 250,
            ),
          ),
          Text(
            'Conheça, Inspire, Preserve',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          Expanded(child: NewsListPage()), // Lista de notícias
          // Exibindo os valores do acelerômetro
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Acelerômetro:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('X: ${_x.toStringAsFixed(2)}'),
                Text('Y: ${_y.toStringAsFixed(2)}'),
                Text('Z: ${_z.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'Plantas urbanas ajudam a reduzir a poluição do ar',
      'description':
          'As plantas urbanas têm um papel importante na purificação do ar, ajudando a reduzir a poluição em áreas urbanas densamente povoadas.'
    },
    {
      'title': 'Iniciativas de reciclagem crescem nas cidades brasileiras',
      'description':
          'Nos últimos anos, várias cidades brasileiras têm adotado políticas de reciclagem e reutilização de materiais, melhorando a sustentabilidade ambiental.'
    },
    {
      'title': 'Comunidades adotam energia solar como alternativa sustentável',
      'description':
          'Em várias regiões, comunidades estão investindo em energia solar, uma alternativa renovável e eficiente para reduzir o impacto ambiental.'
    },
    {
      'title': 'Estudo mostra impacto do desmatamento na biodiversidade',
      'description':
          'Estudos recentes mostram como o desmatamento tem afetado negativamente a biodiversidade, provocando perda de espécies e degradação dos ecossistemas.'
    },
    {
      'title':
          'A importância da preservação de áreas verdes em centros urbanos',
      'description':
          'A preservação de áreas verdes nas cidades é fundamental para a qualidade de vida dos habitantes, oferecendo benefícios para a saúde e bem-estar.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.eco, color: Colors.green, size: 32),
            title: Text(
              news[index]['title']!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    newsTitle: news[index]['title']!,
                    newsDescription: news[index]['description']!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final String newsTitle;
  final String newsDescription;

  NewsDetailPage({
    required this.newsTitle,
    required this.newsDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Notícia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              newsDescription,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
