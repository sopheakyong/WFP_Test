School.create!([
  {school_code: "001", school_name: "Sothearus Primary School"},
  {school_code: "002", school_name: "Chaktomuk Primary School"},
  {school_code: "003", school_name: "Toul Kok Primary School"},
  {school_code: "004", school_name: "Chba Ampov Primary School"}
])
Student.create!([
  {student_id: "001", student_name: "Yin Sok", sex: "M", date_of_birth: "1993-05-02"},
  {student_id: "003", student_name: "San Chury", sex: "F", date_of_birth: "1991-03-14"},
  {student_id: "002", student_name: "Keo Suny", sex: "M", date_of_birth: "1992-05-06"},
  {student_id: "004", student_name: "San Sok", sex: "F", date_of_birth: "1990-06-16"},
  {student_id: "005", student_name: "Pov Sovann", sex: "M", date_of_birth: "1990-06-15"},
  {student_id: "006", student_name: "Pov Davy", sex: "F", date_of_birth: "1990-06-18"},
  {student_id: "007", student_name: "Toch Sambath", sex: "M", date_of_birth: "2005-08-08"},
  {student_id: "008", student_name: "Chan Piseth", sex: "M", date_of_birth: "1997-12-09"},
  {student_id: "009", student_name: "Kun Navy", sex: "F", date_of_birth: "1996-05-10"},
  {student_id: "010", student_name: "Prom Pearum", sex: "M", date_of_birth: "1995-04-06"}
])
StudentPerformance.create!([
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 6, math_s1: 67, khmer_s1: 89, social_s1: 50, math_s2: 46, khmer_s2: 80, social_s2: 90},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 14, math_s1: 60, khmer_s1: 70, social_s1: 50, math_s2: 67, khmer_s2: 80, social_s2: 60},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 4, math_s1: 60, khmer_s1: 90, social_s1: 55, math_s2: 85, khmer_s2: 80, social_s2: 60},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 15, math_s1: 100, khmer_s1: 90, social_s1: 56, math_s2: 45, khmer_s2: 67, social_s2: 78},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 12, math_s1: 78, khmer_s1: 90, social_s1: 56, math_s2: 100, khmer_s2: 90, social_s2: 70},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 16, math_s1: 100, khmer_s1: 99, social_s1: 70, math_s2: 80, khmer_s2: 89, social_s2: 70},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 3, math_s1: 100, khmer_s1: 90, social_s1: 67, math_s2: 99, khmer_s2: 88, social_s2: 89},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 5, math_s1: 99, khmer_s1: 86, social_s1: 78, math_s2: 100, khmer_s2: 97, social_s2: 78},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 13, math_s1: 99, khmer_s1: 89, social_s1: 67, math_s2: 100, khmer_s2: 90, social_s2: 78},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 2, math_s1: 100, khmer_s1: 89, social_s1: 67, math_s2: 100, khmer_s2: 89, social_s2: 60}
])
StudentSchool.create!([
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 5},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 12},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 6},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 14},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 4},
  {school_year: "2018-2019", school_id: 1, grade: 4, student_id: 15},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 16},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 3},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 13},
  {school_year: "2018-2019", school_id: 2, grade: 4, student_id: 2}
])
User.create!([
  {user_name: "Admin", password: "123"}
])
