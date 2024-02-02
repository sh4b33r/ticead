import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridsMovie extends StatelessWidget {
  const GridsMovie({required this.text ,super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return // drawer: const Drawerstudents(),

        // SingleChildScrollView(

        // child:
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                text,
                style:GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.w400),
              ),
              InkWell(
                  onTap: () {
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> catgeoryonlypag))
                  },
                  child: const Icon(Icons.double_arrow))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(11, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color:Colors.black ,blurStyle: BlurStyle.inner ,blurRadius: 1.8)],
                          image: DecorationImage(
                              image: AssetImage(
                                  'asset/image/${movies[index % movies.length]}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 160,
                        width: 110,
                        child: SizedBox()),
                  ),
                );
              })),
        ),
      ],
    );
    // )
  }
}

List<String> movies = [
  '1917_-_Sam_Mendes_-_Hollywood_War_Film_Classic_English_Movie_Poster_a12704bd-2b25-4aa7-8c8d-8f40cf467dc7_large.webp',
  'movie.jpg',
  'preview-page0.jpg',
  'Oppenheimer-CillianMurphy-ChristopherNolan-HollywoodMoviePoster_1_grande.webp',
  'john-wick_u-L-F7SH250.jpg',
  'imagesfd.jpg',
  'bdf11604e1f97d6018da2b62f9129993.jpg',
  'download.jpg',
  'unnamed.jpg',
];
