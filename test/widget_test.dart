// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume_app/core/AI_services/gemini_repo/job_details_service_provider.dart';

import 'package:resume_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  test("test gemini api", () async {
    await AiJobDetailsServiceProvider().getSkills(''' Job description
Job Description
• Designing and developing user-friendly applications
• Ensuring applications are compatible with multiple platforms
• Coordinating with other team members during the application development process
• Identifying and resolving software defects
• Providing support and maintenance for applications

Job Requirements
• Minimum 4+ years of professional experience in software companies.
• Knowledge of native development with Kotlin and Java.
• Familiarity with state management tools such as BLoC.
• Experience with RESTful APIs.
• Experience with Firebase (Realtime Database).
• Knowledge of OOP and SOLID principles.
• Ability to write clean, well-designed, and reusable code.
• Experience with Google Maps.
• Ability to face challenges, search for solutions, and solve problems.
• Provide examples of previous work.''');
  });
}
