import 'package:flutter/material.dart';

class PhotoFilterPage extends StatefulWidget {
  static const String routeName = '/';
  const PhotoFilterPage({super.key});

  @override
  State<PhotoFilterPage> createState() => _PhotoFilterPageState();
}

class _PhotoFilterPageState extends State<PhotoFilterPage> {
  late Size size;
  bool isExpanded = false; //niche je cole aslo eta to sb somoy niche thakbe na,hoy matha ber hoye thakbe,hoy 0 thakbe noyto
                           // onno kono value thakbe depend korteche kono ekta bool value er upor
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(    //puro skin k container diye fell korbo,container tar height,width hobe puro skin ta
                          //skin er vitor stack nibo,tahole stack er width,height hoye jabe puro skin soman
        width: size.width,
        height: size.height,
        child: Stack(   //normally stack er height taunbounded hoy,jodi omn ulekh na kori,cz stack er onk children
                         //thakte pare tai unbounded,but stack ta jodi ekta limited container er modhe diye dei
                         //tar mane stack ta oitar modhe e thakbe always, container er child hisabe 1ta stack
                         //dilam ekhon stack er o width, height container er soman
          children: [
           Positioned.fill(   //stack er aladha height,weight nai,tai positioned image ta jenno puro jayga ta fill kore ney,
               child: Image.asset('images/nature.jpj',fit: BoxFit.cover,), //stack tar width height pabe container thake,
                       //BoxFit.height dile height borabor zoom kore nibe, BoxFit.cover eta width, height borabor zoom kore altimetly eki
           ),
            AnimatedPositioned(  //Icon e click korle je upore niche lafiye lafiye bare kome eta k smoth korte caile positioned k
                                  // Animatedpositioned kore dibo
              curve: Curves.easeInOut, //slowly suru hobe maje 1st then abr last e slowly sesh hobe
              duration: const Duration(milliseconds: 1000) ,   //je kono Animated widget e duration dite hoy

              bottom: isExpanded ? 0 : -(size.height /2) + 70, //container sb somoy bottom theke 0 te thakbe na,jodi Expanded false thake tahole
                                                       //eta aro nicher dike thakbe,tokhon bottom minus hobe,minus e kichu ongsho upore thakbe
                                                   //ekhane isExpanded(open obostay ache) jodi hoy tahole 0 otherwise skin jodi 700 hoy container
                                              //skin er ordhek tahole 330,niche namate hobe ekhon 330 jodi minus kori tahole puro ta e niche neme
                                             //jabe tar theke ektu matha ber hoye thakbe tai +70 dichi
              child: Container(   //slide hoye asbe tai container nibo
                color: Colors.black54,
                width: size.width,
                height: size.height / 2,  //container er height hobe skin er ordhek upor theke,etar subidha hocche phone ta jokhon
                                         // rotated korbo tokhon o ordek e dekhabe, but eta niche cai tai positioned er modhe rakhte hobe
                                    //ei container ta top theke 0 positioned widget e ache,ei container er top er skin er top soman,tai ekhon
                            //container ta k skin er bottom e nite hobe,tarmane container er bottom r skin er bottom soman hobe,tai bottom: 0
                child: ListView(  //karon container er modhe to slider gulo thakbe,jeno scroll korte pari sey jonno child hisabe ListView nilam
                  padding: const EdgeInsets.all(0.0),
                  children: [
                    ListTile(
                      title: const Text('Filter Options', style: TextStyle(fontSize: 18, color: Colors.white ),),
                      trailing: IconButton(  //IconButton ta arrow up thakbe na down thakbe seta depend korteche isExpanded er value er upor
                        onPressed: () {
                          setState(() {    //ebar bottom ta press korle simply oi isExpanded er value double kore dibo
                            isExpanded = !isExpanded; //isExpanded hoye jabe not isExpanded,tar mane er value jodi age true thake tahole
                                                     // hoye jabe false,r false thakle hoye jabe true

                          });
                        },
                        icon: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, color: Colors.white,) , //isExpanded hole
                                             //Expanded kora ache tar mane arrow down,otherwise up hobe,ei muhute isExpanded er value false tai
                                            //up howar kotha but down ache cz eta ekhon Expanded thakar kotha na tai

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
