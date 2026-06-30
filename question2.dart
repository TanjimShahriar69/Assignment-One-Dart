// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/// EXPECTED OUTPUT:
/// Student Scores: {Alice: <random>, Bob: <random>, ...}
/// Highest Score: <Name> with <Score>
/// Lowest Score: <Name> with <Score>
/// Average Score: <Value>
/// Alice: <Score> (Category)
/// ...

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  var studentNames = <String>['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  // 2. Create a Map<String, int> to store student scores
  var studentScores = <String, int>{};

  // 3. Use a for loop to assign random scores (60-100) to each student
  var random = Random();
  for (var student in studentNames) {
    studentScores[student] = 60 + random.nextInt(41);
  }

  // 4. Find and display highest, lowest, and average scores
  var highestStudent = studentNames.first;
  var highestScore = studentScores[highestStudent]!;
  var lowestStudent = studentNames.first;
  var lowestScore = studentScores[lowestStudent]!;
  var total = 0;

  for (var student in studentNames) {
    var score = studentScores[student]!;
    total += score;
    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  }

  var averageScore = total / studentNames.length;

  print('Student Scores: $studentScores');
  print('Highest Score: $highestStudent with $highestScore');
  print('Lowest Score: $lowestStudent with $lowestScore');
  print('Average Score: $averageScore');

  // 5. Use a switch statement to categorize students
  for (var student in studentNames) {
    var score = studentScores[student] ?? 0;
    var category = '';

    switch (score) {
      case >= 90 && <= 100:
        category = 'Excellent';
        break;
      case >= 80 && <= 89:
        category = 'Good';
        break;
      case >= 70 && <= 79:
        category = 'Average';
        break;
      default:
        category = 'Needs Improvement';
    }

    print('$student: $score ($category)');
  }
}