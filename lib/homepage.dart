import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auth_screen/constants.dart';
import 'package:auth_screen/screens/details_screen.dart';
import 'package:auth_screen/widgets/category_card.dart';

class MyHomePage extends StatelessWidget {
  final title = 'Orderlahh';

  MyHomePage({Key key, title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Color(0xFFF5CEB8),
        elevation: 0.0
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  image: AssetImage("assets/images/meditation_bg.png"),
                  fit: BoxFit.cover)
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Manage Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailsScreen();
                  }),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      //bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .40,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                  SizedBox(height: 20),
                  Text(
                    "Welcome, Unknown", 
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  //SearchBar(),
                  SizedBox(height: 25),
                  Text(
                      "Browse Products",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  SizedBox(height: 10),
                  
                  Container(
                    height: 190,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      childAspectRatio: .85,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "All",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Stores",
                          svgSrc: "assets/icons/Hamburger.svg", 
                          press: () {},
                        ),
                        CategoryCard(
                          title: "E-Shop",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
  
                    Text(
                      "My Stores",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),  
                      child: Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/icons/Meditation_women_small.svg",
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sell your products",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                  Text("Manage your products here")
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}