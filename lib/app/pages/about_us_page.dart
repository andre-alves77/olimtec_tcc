import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPage();
}

class _AboutUsPage extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'SOBRE NÓS',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: AboutUsSingleCard(
                          image: "assets/images/LOGO_USUARIO.png",
                          name: 'Gabriel Rocha',
                          role: 'Full Stack',
                          pix: '548.084.918-26'),
                    ),
                    Flexible(
                      child: AboutUsSingleCard(
                          image: "assets/images/LOGO_USUARIO.png",
                          name: 'Luan Dias',
                          role: 'Full Stack',
                          pix: '123.456.789-12'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: AboutUsSingleCard(
                          image: "assets/images/LOGO_USUARIO.png",
                          name: 'Riquelme Viana',
                          role: 'Full Stack',
                          pix: '987.654.321-98'),
                    ),
                    Flexible(
                      child: AboutUsSingleCard(
                          image: "assets/images/LOGO_USUARIO.png",
                          name: 'Vinicius Vitoriano',
                          role: 'Full Stack',
                          pix: '248.654.456-45'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 4,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 190),
                        child: AboutUsSingleCard(
                            image: "assets/images/LOGO_USUARIO.png",
                            name: 'André Alves',
                            role: 'Full Stack',
                            pix: '324.575.384-43'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutUsSingleCard extends StatelessWidget {
  const AboutUsSingleCard(
      {required this.image,
      required this.name,
      required this.role,
      required this.pix});

  final String image;
  final String name;
  final String role;
  final String pix;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.05,
      child: Card(
        color: Theme.of(context).colorScheme.background,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: FittedBox(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    image,
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Pix: $pix',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
