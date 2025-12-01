import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(EcoradarApp());
}

class EcoradarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecoradar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
          // Exibição da logo como asset
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapPage(),
            ),
          );
        },
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  final List<String> news = [
    'Plantas urbanas ajudam a reduzir a poluição do ar',
    'Iniciativas de reciclagem crescem nas cidades brasileiras',
    'Comunidades adotam energia solar como alternativa sustentável',
    'Estudo mostra impacto do desmatamento na biodiversidade',
    'A importância da preservação de áreas verdes em centros urbanos'
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
              news[index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(newsTitle: news[index]),
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

  NewsDetailPage({required this.newsTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: Center(
        child: Text(
          newsTitle,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
              -23.55052, -46.633308), // Localização inicial (São Paulo, Brasil)
          zoom: 12,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
