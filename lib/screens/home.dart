import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 34, 34),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl('https://github.com/AzorAha1');
                        },
                        child: Image.asset(
                          'assets/images/gitpngwing.com.png',
                          width: 55,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          launchUrl('https://youtube.com');
                        },
                        child: Image.asset(
                          'assets/images/pngwing.com.png',
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TabButton(
                        text: 'Home',
                        isSelected: _selectedindex == 0,
                        onpress: () => ontabSelected(0),
                      ),
                      SizedBox(width: 10),
                      TabButton(
                        text: 'About',
                        isSelected: _selectedindex == 1,
                        onpress: () => ontabSelected(1),
                      ),
                      SizedBox(width: 10),
                      TabButton(
                        text: 'Resume',
                        isSelected: _selectedindex == 2,
                        onpress: () => ontabSelected(2),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TabButton(
                        text: 'Services',
                        isSelected: _selectedindex == 3,
                        onpress: () => ontabSelected(3),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TabButton(
                        text: 'Projects',
                        isSelected: _selectedindex == 4,
                        onpress: () => ontabSelected(4),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TabButton(
                        text: 'Experience',
                        isSelected: _selectedindex == 5,
                        onpress: () => ontabSelected(5),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ontabSelected(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
}

// class TabButton extends StatelessWidget {
//   final String text;

//   const TabButton({Key? key, required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Function()? onpress;
//     return GestureDetector(
//       onTap: onpress,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20.0,
//         ),
//       ),
//     );
//   }
// }

class TabButton extends StatelessWidget {
  final String text;
  final Function()? onpress;
  final bool isSelected;
  const TabButton(
      {Key? key, required this.text, this.onpress, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? Colors.blue
                  : Colors.transparent, // Change color based on selection
              width: 2,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void main() {
  runApp(Home());
}
