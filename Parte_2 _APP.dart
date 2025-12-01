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
    );
  }
}

class News {
  final String title;
  final String content;

  News({required this.title, required this.content});
}

class NewsListPage extends StatelessWidget {
  final List<News> news = [
    News(
      title: 'Plantas urbanas ajudam a reduzir a poluição do ar',
      content:
          'Estudos comprovam que as plantas urbanas podem ajudar na redução da poluição atmosférica, melhorando a qualidade do ar nas cidades. Plantas como árvores e jardins podem filtrar gases nocivos e proporcionar um ambiente mais saudável.',
    ),
    News(
      title: 'Iniciativas de reciclagem crescem nas cidades brasileiras',
      content:
          'Nos últimos anos, diversas cidades brasileiras têm se empenhado em aumentar a coleta seletiva e incentivar a reciclagem. Com isso, muitos materiais recicláveis como plásticos, vidros e papéis têm sido reciclados, contribuindo para a redução do impacto ambiental.',
    ),
    News(
      title: 'Comunidades adotam energia solar como alternativa sustentável',
      content:
          'Cada vez mais, as comunidades no Brasil estão adotando a energia solar como alternativa sustentável e econômica. O uso de painéis solares está se expandindo, ajudando a reduzir a dependência de fontes de energia não renováveis e a diminuir a pegada de carbono.',
    ),
    News(
      title: 'Estudo mostra impacto do desmatamento na biodiversidade',
      content:
          'Pesquisas recentes revelam que o desmatamento nas florestas tropicais está provocando sérios danos à biodiversidade global. A destruição dos habitats naturais está colocando muitas espécies de plantas e animais em risco de extinção.',
    ),
    News(
      title: 'A importância da preservação de áreas verdes em centros urbanos',
      content:
          'As áreas verdes em centros urbanos desempenham um papel vital na saúde e bem-estar da população. Elas ajudam a mitigar os efeitos das ilhas de calor, reduzem a poluição do ar e oferecem espaços para atividades recreativas e sociais.',
    ),
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
              news[index].title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news[index]),
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
  final News news;

  NewsDetailPage({required this.news}); // Construtor com a notícia completa

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
              news.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              news.content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                height: 1.5, // Melhora o espaçamento entre linhas
              ),
            ),
          ],
        ),
      ),
    );
  }
}
