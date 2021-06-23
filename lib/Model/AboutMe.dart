class AboutMe{
   String myStory;
   String  myExperience;
   int years;

   AboutMe(this.myStory, this.myExperience, this.years);

   AboutMe.fromJson(Map<String ,dynamic> objectJson){
     this.myExperience = objectJson['myExperience'];
     this.myStory = objectJson['myStory'];
     this.years = objectJson['yearsOfExperience'];

   }
}