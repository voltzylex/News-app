// ignore_for_file: avoid_print
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> navBarItem = [
    'Top News',
    'tech',
    'Trending',
    'Finance',
    'India',
    'World',
    'Health'
  ];
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News app'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Making Contaier
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('button is pressed');
                      if ((textController.text).replaceAll(" ", "") == "") {
                        print("Blank search");
                      } else {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Search(searchController.text)));
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: const Icon(Icons.search),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      textInputAction: TextInputAction.search,
                      cursorColor: Colors.blue,
                      onSubmitted: ((value) {
                        print(value);
                      }),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search News',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white24,
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        navBarItem[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0, autoPlay: true, enlargeCenterPage: true),
              items: colorPallet.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          color: i,
                          child: Text(
                            'text ',
                            style: TextStyle(fontSize: 16.0),
                          )),
                    );
                  },
                );
              }).toList(),
            ),

            Expanded(
              child: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 1.0,
                          child: Stack(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    'https://media.istockphoto.com/photos/breaking-news-world-news-with-map-backgorund-picture-id1182477852?k=20&m=1182477852&s=612x612&w=0&h=I3wdSzT_5h1y9dHq_YpZ9AqdIKg8epthr8Guva8FkPA=',
                                  ),
                                ),
                              ),
                              Positioned(
                                // top: 0,
                                left: 5,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black12.withOpacity(0),
                                        Colors.black87
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Text(
                                    'News Headline',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Color> colorPallet = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.blueGrey,
    Colors.orange,
  ];
}
// Image(image: AssetImage('images/news.png'))
