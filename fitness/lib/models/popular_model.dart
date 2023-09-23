class PopularDietModel {
  String name ;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
  });

 static List<PopularDietModel> getPopularDiet(){
    List<PopularDietModel> popularDiets = [];
    
     popularDiets.add(
      PopularDietModel(
        name: 'BlueBerry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30min',
        calorie: '230kCal',
        boxIsSelected: true,
      ),
    );

    popularDiets.add(
      PopularDietModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20min',
        calorie: '120kCal',
        boxIsSelected: false,
      ),
    );

    return popularDiets;
  }

}