import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  static String route = "/aboutus_user";

  @override
  State<AboutUsPage> createState() => _AboutUsPage();
}

_launchURLRocha() async {
  const url =
      'https://www.linkedin.com/authwall?trk=bf&trkInfo=AQFO0BArHELcpQAAAYxGfwogqVw2DibNt9nnPTZEY_b-8HuX5Gng2OOzGmStBuntaZ5IFHbhrKlMqF7E4a41zlokGjZzhkFzRMih_oGQm4uGC2lxsbyRpx68RQWZxW4mBZLHcSU=&original_referer=&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fgabriel-rocha-matos-421b16272%3Futm_source%3Dshare%26utm_campaign%3Dshare_via%26utm_content%3Dprofile%26utm_medium%3Dandroid_app';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _AboutUsPage extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                        image: "assets/images/rochar.png",
                        name: 'Gabriel Rocha',
                        role: 'Designer',
                      ),
                    ),
                    Flexible(
                      child: AboutUsSingleCard(
                        image: "assets/images/luan.png",
                        name: 'Luan Dias',
                        role: 'Front-end',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: AboutUsSingleCard(
                        image: "assets/images/riquelme.png",
                        name: 'Riquelme Viana',
                        role: 'Front-end',
                      ),
                    ),
                    Flexible(
                      child: AboutUsSingleCard(
                        image: "assets/images/vini.png",
                        name: 'Vinicius Vitoriano',
                        role: 'Front-end',
                      ),
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
                          image: "assets/images/andre.png",
                          name: 'André Alves',
                          role: 'Full Stack',
                        ),
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
  const AboutUsSingleCard({
    required this.image,
    required this.name,
    required this.role,
  });

  final String image;
  final String name;
  final String role;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.05,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: FittedBox(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
