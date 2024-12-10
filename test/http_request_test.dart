import 'package:resume_app/core/AI_services/gemini_repo/job_details_service_provider.dart';

void main() async {
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
}
