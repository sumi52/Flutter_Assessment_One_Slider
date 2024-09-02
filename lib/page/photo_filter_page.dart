import 'package:flutter/material.dart';

class PhotoFilterPage extends StatefulWidget {
  static const String routeName = '/';
  const PhotoFilterPage({super.key});

  @override
  State<PhotoFilterPage> createState() => _PhotoFilterPageState();
}

class _PhotoFilterPageState extends State<PhotoFilterPage> {
  late Size size;
  bool isExpanded = false; 
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(    
        width: size.width,
        height: size.height,
        child: Stack(   
          children: [
           Positioned.fill(  
               child: Image.asset('images/nature.jpj',fit: BoxFit.cover,), 
           ),
            AnimatedPositioned(  
              curve: Curves.easeInOut, 
              duration: const Duration(milliseconds: 1000) ,   

              bottom: isExpanded ? 0 : -(size.height /2) + 70, 
              child: Container(   
                color: Colors.black54,
                width: size.width,
                height: size.height / 2,  
                child: ListView(  
                  padding: const EdgeInsets.all(0.0),
                  children: [
                    ListTile(
                      title: const Text('Filter Options', style: TextStyle(fontSize: 18, color: Colors.white ),),
                      trailing: IconButton(  
                        onPressed: () {
                          setState(() {    
                            isExpanded = !isExpanded; 

                          });
                        },
                        icon: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, color: Colors.white,) , 

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
