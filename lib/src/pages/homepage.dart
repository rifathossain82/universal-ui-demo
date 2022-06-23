import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:universe_ui_demo/src/constraints/colors.dart';
import 'package:universe_ui_demo/src/model/planetInfo.dart';
import 'package:universe_ui_demo/src/pages/detailsPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientStartColor,
              gradientEndColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: titleTextColor,
                  ),
                ),
                DropdownButton<String>(
                  onChanged: (val){},
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'Solar System',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: contentTextColor,
                        ),
                      ),
                    ),
                  ],
                  icon: Image.asset('assets/drop_down_icon.png'),
                  underline: SizedBox(),
                ),
                Container(
                  height: 500,
                  child: Swiper(
                    itemCount: planets.length,
                    itemWidth: size.width-2*50,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        size: 8,
                        activeSize: 10,
                        color: contentTextColor,
                        activeColor: titleTextColor,
                      ),
                      alignment: Alignment.bottomCenter
                    ),
                    itemBuilder: (context, index){
                      return buildPlanetCard(size, index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigation(size),
    );
  }

  Widget buildPlanetCard(Size size, int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(planetInfo: planets[index],)));
      },
      child: Stack(
        children: [
          Column (
            children: [
              SizedBox(
                height: size.height*0.1,
              ),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: titleTextColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height*0.3,),
                      Text(
                        '${planets[index].name}',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        'Solar System',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: primaryTextColor,
                        ),
                      ),
                      SizedBox(height: size.height*0.03,),
                      Row(
                        children: [
                          Text(
                            'Know more',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: secondaryTextColor,
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: secondaryTextColor,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Hero(
            tag: planets[index].position,
            child: Image.asset('${planets[index].iconImage}'),
          ),
          Positioned(
            right: 24,
            bottom: 60,
            child: Text(
              planets[index].position.toString(),
              style: TextStyle(
                fontSize: 200,
                color: primaryTextColor.withOpacity(0.08),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigation(Size size){
    return Container(
      height: size.height*0.07,
      width: size.width,
      decoration: BoxDecoration(
        color: navigationColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/menu_icon.png'),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Image.asset('assets/search_icon.png'),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Image.asset('assets/profile_icon.png'),
            onPressed: (){

            },
          )
        ],
      ),
    );
  }
}
