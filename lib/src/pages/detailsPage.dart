import 'package:flutter/material.dart';
import 'package:universe_ui_demo/src/model/planetInfo.dart';

import '../constraints/colors.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.planetInfo}) : super(key: key);

  PlanetInfo planetInfo;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImageAndNumber(),
                buildTitle_content(),
                Divider(
                  color: contentTextColor,
                ),
                SizedBox(height: 30,),
                buildGallerySection(),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageAndNumber(){
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_outlined)
            ),
            Text(
              widget.planetInfo.position.toString(),
              style: TextStyle(
                fontSize: 200,
                color: primaryTextColor.withOpacity(0.08),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Positioned(
          top: -20,
          left: 70,
          child: SizedBox(
            height: 350,
            width: 350,
            child: Hero(
              tag: widget.planetInfo.position,
              child: Image.asset('${widget.planetInfo.iconImage}'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitle_content(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.planetInfo.name}',
          style: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w900,
            color: primaryTextColor,
          ),
        ),
        SizedBox(height: 8,),
        Text(
          'Solar System',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w300,
            color: primaryTextColor,
          ),
        ),
        Divider(
          color: contentTextColor,
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.planetInfo.description}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryTextColor.withOpacity(0.7),
                    ),
                  ),
                  TextSpan(
                    text: ' Read more',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGallerySection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallery',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
        ),
        SizedBox(height: 16,),
        widget.planetInfo.images!.length<1 ?
        Container()
            :
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.planetInfo.images!.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryTextColor,
                      image: DecorationImage(
                        image: NetworkImage('${widget.planetInfo.images![index]}'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
