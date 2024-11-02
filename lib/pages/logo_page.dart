// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         Stack(
//           children: [

//             Image.asset(
//               'images/shap.png',
//               fit: BoxFit.cover,

//             ),

//             Positioned(
//               top: 10,
//               left: 0,
//               child: ClipRect(
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   widthFactor: 0.1, // Adjust this value as needed
//                   heightFactor: 0.2,
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     // Adjust opacity as needed
//                   ),
//                 ),
//               ),
//             ),
//             // Additional widgets can be added on top of the image if needed
//           ],
//         ),
//       Center(
//             child: Container(
//               margin: const EdgeInsets.only(top: 180),
//               child: Image.asset(
//                 'images/logo2.jpg',
//                 width: 500,
//                 height: 450,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 80,
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(327, 80),
//                 backgroundColor: const Color.fromRGBO(21, 135, 112, 1),
//                 elevation: 10,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(50)))),
//             onPressed: () {},
//             child: const Text(
//               'Get Started',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color:Colors.white,
//                   height: 1.5),
//             ),
//           ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'images/shap.png',
                fit: BoxFit.cover,
                // width: screenWidth,
                // height: screenHeight * 0.4, // Responsive height for the image
              ),
              Positioned(
                top: 10,
                left: 0,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.1,
                    heightFactor: 0.2,
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.1),
              child: Image.asset(
                'images/logo1.jpeg',
                width: screenWidth * 0.8, // Responsive width
                height: screenHeight * 0.3, // Responsive height
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Responsive space
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(screenWidth * 0.8, 60), // Responsive button size
              backgroundColor: const Color.fromRGBO(21, 135, 112, 1),
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
