// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Vehicle Info: 2020 Toyota Camry (4 doors)
/// Starting the car engine...
/// Stopping the car engine...
///
/// Vehicle Info: 2021 Honda CBR (Has windshield: true)
/// Starting the motorcycle engine...
/// Stopping the motorcycle engine...
///
/// Car age: <Value> years
/// Motorcycle age: <Value> years

abstract class Vehicle {
  Vehicle(this.brand, this.model, this.year);

  String brand;
  String model;
  int year;

  // Abstract methods
  void start();
  void stop();

  // Concrete method
  void displayInfo() {
    print('Vehicle Info: $year $brand $model');
  }

  // Calculate vehicle age (current year - vehicle year)
  int calculateAge() => DateTime.now().year - year;
}

class Car extends Vehicle {
  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);

  int numberOfDoors;

  @override
  void start() {
    print('Starting the car engine...');
  }

  @override
  void stop() {
    print('Stopping the car engine...');
  }

  @override
  void displayInfo() {
    print('Vehicle Info: $year $brand $model ($numberOfDoors doors)');
  }
}

class Motorcycle extends Vehicle {
  Motorcycle(String brand, String model, int year, this.hasWindshield)
      : super(brand, model, year);

  bool hasWindshield;

  @override
  void start() {
    print('Starting the motorcycle engine...');
  }

  @override
  void stop() {
    print('Stopping the motorcycle engine...');
  }

  @override
  void displayInfo() {
    print(
      'Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)',
    );
  }
}

void main() {
  var vehicles = <Vehicle>[
    Car('Toyota', 'Camry', 2020, 4),
    Motorcycle('Honda', 'CBR', 2021, true),
  ];

  for (var vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print('');
  }

  print('Car age: ${vehicles[0].calculateAge()} years');
  print('Motorcycle age: ${vehicles[1].calculateAge()} years');
}
