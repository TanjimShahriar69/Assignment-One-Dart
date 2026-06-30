// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
/// Job Title: Manager
/// Base Salary: 8000.0
/// Calculated Salary: 9000.0
/// Payment processed: 9000.0
/// Report: Monthly report for John Smith in IT department
///
/// Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
/// Job Title: Senior Developer
/// Base Salary: 6000.0
/// Calculated Salary: 6500.0
/// Payment processed: 6500.0

mixin Payable {
  double calculateSalary(double baseSalary, double bonus) =>
      baseSalary + bonus;

  void processPayment(double amount) {
    print('Payment processed: $amount');
  }
}

mixin Reportable {
  String generateReport(String employeeName, String department) =>
      'Report: Monthly report for $employeeName in $department department';
}

abstract class Employee {
  Employee(this.name, this.id, this.department);

  String name;
  String id;
  String department;

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    print('Employee: $name (ID: $id, Department: $department)');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: ${getBaseSalary()}');
  }
}

class Manager extends Employee with Payable, Reportable {
  Manager(super.name, super.id, super.department, this.teamSize);

  int teamSize;

  @override
  String getJobTitle() => 'Manager';

  @override
  double getBaseSalary() => 8000.0;

  @override
  void displayInfo() {
    print('Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: ${getBaseSalary()}');
  }
}

class Developer extends Employee with Payable {
  Developer(super.name, super.id, super.department, this.programmingLanguage);

  String programmingLanguage;

  @override
  String getJobTitle() => 'Senior Developer';

  @override
  double getBaseSalary() => 6000.0;

  @override
  void displayInfo() {
    print('Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: ${getBaseSalary()}');
  }
}

void main() {
  var manager = Manager('John Smith', 'M001', 'IT', 5);
  var developer = Developer('Alice Johnson', 'D001', 'IT', 'Dart');

  manager.displayInfo();
  var managerSalary = manager.calculateSalary(manager.getBaseSalary(), 1000.0);
  print('Calculated Salary: $managerSalary');
  manager.processPayment(managerSalary);
  print(manager.generateReport(manager.name, manager.department));

  print('');

  developer.displayInfo();
  var developerSalary =
      developer.calculateSalary(developer.getBaseSalary(), 500.0);
  print('Calculated Salary: $developerSalary');
  developer.processPayment(developerSalary);
}
