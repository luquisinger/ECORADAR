import 'package:flutter/material.dart';

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
          // Exibição da logo como asset com tratamento de erro
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                try {
                  return Image.asset(
                    'assets/images/ecoradar.png', // Caminho da imagem
                    height: 100,
                  );
                } catch (e) {
                  // Exibe mensagem de erro se a imagem falhar
                  return Text(
                    'Erro ao carregar a logo. Verifique o caminho.',
                    style: TextStyle(color: Colors.red),
                  );
                }
              },
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
    try {
      // Simulação de erro: descomente a linha abaixo para testar
      // throw Exception("Erro ao carregar as notícias.");

      if (news.isEmpty) throw Exception("Nenhuma notícia disponível no momento.");

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
    } catch (e) {
      // Exibe mensagem de erro em caso de falha
      return Center(
        child: Text(
          'Erro ao carregar as notícias: ${e.toString()}',
          style: TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}

class NewsDetailPage extends StatelessWidget {
  final String newsTitle;

  NewsDetailPage({required this.newsTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Notícia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            try {
              // Simulação de erro: descomente para testar
              // throw Exception("Erro ao carregar detalhes da notícia.");

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aqui você pode incluir o conteúdo completo da notícia. Por enquanto, estamos exibindo apenas o título.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            } catch (e) {
              // Exibe mensagem de erro caso falhe ao carregar os detalhes
              return Center(
                child: Text(
                  'Erro ao carregar os detalhes da notícia: ${e.toString()}',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
