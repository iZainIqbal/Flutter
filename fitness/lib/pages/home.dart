import 'package:fitness/models/category_models.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];


  void _getInitialInfo(){
     categories = CategoryModel.getCategories();
     diets = DietModel.getDiets();
     popularDiets = PopularDietModel.getPopularDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        
        children: [
          _searchText(),
          const SizedBox(height: 40,),
           _categoriesSection(),
           const SizedBox(height: 40,),
            _dietSection(),
           const SizedBox(height: 40,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
           )  ,
           const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  Padding(
              padding: EdgeInsets.only(left :20.0),
              child: Text('Recomendation\nfor Diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
               ),
              ),
            ),
           const SizedBox(height: 15,),
            SizedBox(
              height: 240,
              child: ListView.separated(
                itemBuilder: (context,index){
                  return Container(
                    
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20), 
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].iconPath),
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          diets[index].level + ' | ' + diets[index].duration + ' | '+ diets[index].calories,
                          style: TextStyle(
                            color: Color(0xff786f72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ), 
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child:  Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ?  Colors.white : Color(0xffc588f2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14, 
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                               diets[index].viewIsSelected ?  Color(0xff9dceff) : Colors.transparent,
                               diets[index].viewIsSelected ? Color(0xff92a3fd) : Colors.transparent
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),

                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index) => const SizedBox(width: 25,),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
         );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
               ),
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemBuilder: (context,index){
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
      );
  }

  Container _searchText() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0 ,
              ),
            ] 
          ),
          child: TextField(
            
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Pancakes',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(15), 
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/Search.svg'),
                
              ),
              suffixIcon:  SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                       const VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding:  const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          alignment: Alignment.center ,
            margin: const  EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              height: 20,
              width: 20,
            ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
              alignment: Alignment.center ,
              width: 37,
            margin: const  EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        )
      ],
    );
  }
}