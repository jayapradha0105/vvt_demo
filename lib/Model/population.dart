class Population{
  int year;
  int population;

  Population({this.year = 0, this.population=0});

  factory Population.fromJson(Map<String, dynamic> parsedJson) {
    return Population(
      year: int.parse(parsedJson['Year']),
      population:parsedJson['Population'],
    );
  }
}