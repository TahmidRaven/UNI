void main() {
  // Numbers
  int integerNumber = 42;
  double doubleNumber = 3.14;

  // Strings
  String message = 'Hello, Dart!';

  // Booleans
  bool isDartFun = true;

  // Lists
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  List<String> friendship = [
    'Jon Snow',
    'Tyrion Lannister',
    'Arya Stark',
    'Sansa Stark'
  ];
  friendship.add("Ned Stark");
  friendship.remove("Tyrion Lannister");

  // Maps
  Map<String, int> studentGrades = {'Alice': 90, 'Bob': 85, 'Charlie': 78};

  // Sets
  Set<int> uniqueNumbers = {1, 2, 3, 4, 5, 1, 2};

  // Dynamic Type
  dynamic dynamicVariable = 'This can hold any type';

  // Print values
  print('Integer: $integerNumber');
  print('Double: $doubleNumber');
  print('String: $message');
  print('Boolean: $isDartFun');
  print('Numbers: $numbers');
  print('Fruits: $fruits');
  print('Student Grades: $studentGrades');
  print('Unique Numbers: $uniqueNumbers');
  print('Dynamic Variable: $dynamicVariable');
  print(friendship);

  // eidGreetings();
  String eid = eidGreetings();
  print(eid);

  // oop
  BankAccountOpen user01 = BankAccountOpen("Tahmid", 23, true);
  BankAccountOpen user02 = BankAccountOpen("Raven", 23, false);

  print(user01.name);
  print(user02.name); // Fixed: Changed user02.age to user02.name
  print(user01.age);
}

String eidGreetings() {
  return "Eid Mubarak!";
}

class BankAccountOpen {
  String name;
  int age;
  bool hasNID;


  BankAccountOpen(String name, int age, bool hasNID)
      : name = name,
        age = age,
        hasNID = hasNID;
}