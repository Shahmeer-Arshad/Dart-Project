import 'dart:io';

class Car {
  String brand;
  String model;
  String registrationNumber;
  bool available;

  Car(this.brand, this.model, this.registrationNumber, this.available);

  void display() {
    print('Brand: $brand, Model: $model, Registration Number: $registrationNumber');
  }
}

class CarRentalSystem {
  List<Car> cars;

  CarRentalSystem(this.cars);

  void displayAvailableCars() {
    print('Available Cars:');
    for (var car in cars) {
      if (car.available) {
        car.display();
      }
    }
  }

  void rentCar(String registrationNumber) {
    for (var car in cars) {
      if (car.registrationNumber == registrationNumber && car.available) {
        car.available = false;
        print('You have rented ${car.brand} ${car.model}.');
        return;
      }
    }
    print('Car not found or unavailable.');
  }

  void returnCar(String registrationNumber) {
    for (var car in cars) {
      if (car.registrationNumber == registrationNumber && !car.available) {
        car.available = true;
        print('Thank you for returning ${car.brand} ${car.model}.');
        return;
      }
    }
    print('Car not found or already returned.');
  }
}

void main() {
  var car1 = Car('Toyota', 'Corolla', 'ABC123', true);
  var car2 = Car('Honda', 'Civic', 'XYZ456', false);
  var car3 = Car('Ford', 'Focus', 'DEF789', true);

  var carRentalSystem = CarRentalSystem([car1, car2, car3]);

  while (true) {
    print('\nCar Rental System Menu:');
    print('1. Display available cars');
    print('2. Rent a car');
    print('3. Return a car');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        carRentalSystem.displayAvailableCars();
        break;
      case 2:
        stdout.write('Enter registration number of the car you want to rent: ');
        var regNum = stdin.readLineSync()!;
        carRentalSystem.rentCar(regNum);
        break;
      case 3:
        stdout.write('Enter registration number of the car you want to return: ');
        var regNum = stdin.readLineSync()!;
        carRentalSystem.returnCar(regNum);
        break;
      case 4:
        print('Thank you for using the Car Rental System. Goodbye!');
        return;
      default:
        print('Invalid choice. Please enter a number between 1 and 4.');
    }
  }
}