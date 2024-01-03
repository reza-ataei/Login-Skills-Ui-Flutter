import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeMode == ThemeMode.dark?MyAppThemeConfig.dark().getTheme():MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(toggleThemeMode: () {
        setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
      },),
    );
  }
}

class MyAppThemeConfig{
  final Color primaryTextColor;
  final Color secoundryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark():
  primaryTextColor = Colors.white,
  secoundryTextColor = Colors.white70,
  surfaceColor = const Color(0x0dffffff),
  backgroundColor = const Color.fromARGB(255, 30, 30, 30),
  appBarColor = Colors.black,
  brightness = Brightness.dark;

  MyAppThemeConfig.light():
  primaryTextColor = Colors.grey.shade900,
  secoundryTextColor = Colors.grey.shade900.withOpacity(0.8),
  surfaceColor = const Color(0x0d000000),
  backgroundColor = const Color.fromARGB(255, 235, 235, 235),
  appBarColor = Colors.white,
  brightness = Brightness.light;
  

    ThemeData getTheme(){
      Color primaryColor = Colors.pink.shade400;
      return ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: appBarColor , foregroundColor: primaryTextColor),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) , borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color.fromARGB(100, 50, 50, 50),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor))),

        textTheme: GoogleFonts.latoTextTheme(TextTheme(
          bodyText2: TextStyle(fontSize: 15 , color: primaryTextColor),
          headline6: TextStyle(fontSize: 22 , color: primaryTextColor),
          subtitle1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold , color: primaryTextColor), //title bar size
          subtitle2: TextStyle(
              fontSize: 14, color: secoundryTextColor),
        )),

        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        
      );
    }

  
}

class MyHomePage extends StatefulWidget {

  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Skill { photoShop, adobeXd, illustrator, afterEffect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  Skill skills = Skill.photoShop;
  void UpdateSelect(Skill type) {
    setState(() {
      skills = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Test'),
        actions: [
          const Icon(CupertinoIcons.chat_bubble),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/profile_image.png',
                        width: 60,
                        height: 60,
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reza Ataei',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Product & Print Designer'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 15,
                              color:
                                  Theme.of(context).textTheme.subtitle2!.color,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Tehran , Iran',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                  child: Text(
                    'English texts for beginners to practice reading and comprehension online and for free. Practicing your comprehension of written English will both improve your vocabulary and understanding of grammar and word order',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 3, 0, 22),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Skills',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 14.5),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        CupertinoIcons.chevron_down,
                        size: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                direction: Axis.horizontal,
                children: [
                  Skills(
                    type: Skill.photoShop,
                    title: 'Photoshop',
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    isActive: skills == Skill.photoShop,
                    onTap: () {
                      UpdateSelect(Skill.photoShop);
                    },
                  ),
                  Skills(
                    type: Skill.adobeXd,
                    title: 'Adobe XD',
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    isActive: skills == Skill.adobeXd,
                    onTap: () {
                      UpdateSelect(Skill.adobeXd);
                    },
                  ),
                  Skills(
                    type: Skill.illustrator,
                    title: 'illustrator',
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange,
                    isActive: skills == Skill.illustrator,
                    onTap: () {
                      UpdateSelect(Skill.illustrator);
                    },
                  ),
                  Skills(
                    type: Skill.afterEffect,
                    title: 'After Effect',
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.deepPurple,
                    isActive: skills == Skill.afterEffect,
                    onTap: () {
                      UpdateSelect(Skill.afterEffect);
                    },
                  ),
                  Skills(
                    type: Skill.lightRoom,
                    title: 'Lightroom',
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blueGrey,
                    isActive: skills == Skill.lightRoom,
                    onTap: () {
                      UpdateSelect(Skill.lightRoom);
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 5, 32, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 14.5, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 20,),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){},
                       child: const Text('Save')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  final Skill type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skills({
    super.key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 100,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(18))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: isActive
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: shadowColor.withOpacity(0.5), blurRadius: 25)
                      ])
                    : null,
                child: Image.asset(
                  imagePath,
                  width: 45,
                  height: 45,
                )),
            const SizedBox(
              height: 6,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
