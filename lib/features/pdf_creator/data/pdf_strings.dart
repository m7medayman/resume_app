import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:word_generator/word_generator.dart';

class PdfStrings {
  // Professional Summary
  static const professionalSummary =
      'Motivated Flutter Developer with strong expertise in cross-platform mobile app development, leveraging clean architecture principles and RESTful APIs. Proficient in converting Figma designs into responsive applications, implementing animations, and deploying apps to Google Play and App Store. Adept in Object-Oriented Programming (OOP), problem-solving, and collaboration. Seeking to contribute to innovative projects at Nahdet Misr Group.';

  // Key Skills
  static const keySkillsTitle = 'Key Skills';
  static const keySkills = [
    'Flutter development (mobile & web)',
    'Clean architecture and MVVM design',
    'RESTful API integration',
    'State management (BLoC)',
    'Animation principles in Flutter',
    'Publishing apps on Google Play and App Store',
    'Object-Oriented Programming (OOP)',
    'CSS for UI/UX enhancement',
    'Agile development and teamwork',
  ];

  // Technical Proficiencies
  static const technicalProficienciesTitle = 'Technical Proficiencies';
  static const programmingLanguages =
      'Programming Languages: Flutter, Dart, Python, C++';
  static const tools = 'Tools: Git, Firebase, GraphQL';
  static const platforms = 'Platforms: Android, iOS';

  // Education
  static const educationTitle = 'Education';
  static const educationDetails =
      'Bachelor of Biomedical Engineering\nFaculty of Engineering, Benha University (2019 - 2024)';
  static const graduationProject =
      'Graduation Project: Developed a Human Balance Measurement System using Python, featuring real-time data visualization and precise metric computation. GitHub: graduation_project';

  // Professional Experience
  static const professionalExperienceTitle = 'Professional Experience';
  static const freelanceFlutterDeveloper = 'Freelance Flutter Developer';
  static const medicalDevicesApp =
      'Medical Devices Management App (Ongoing):\n\nStreamlined healthcare device tracking and maintenance through a robust Flutter-based app.\nIntegrated real-time status monitoring and intuitive UI for healthcare systems.';
  static const resumeApp =
      'Resume App:\n\nDesigned an AI-driven resume builder to optimize compatibility with ATS algorithms for job applications.';
  static const accurateTaskApp =
      'Accurate Task App:\n\nDeveloped a Flutter app leveraging GraphQL for secure user authentication and efficient data handling.';
  static const weatherAppUI =
      'Weather App UI:\n\nConverted a Figma design into a responsive Flutter app with interactive animations for seamless UX.';

  // Key Projects
  static const keyProjectsTitle = 'Key Projects';
  static const shopApp =
      'Shop App with Clean Architecture:\n\nApplied clean architecture principles to create a feature-rich shop app based on Figma designs.\nGitHub: cleanArchitectureShopApp';
  static const websiteDevelopment =
      'Website Development with Flutter:\n\nBuilt a responsive web app utilizing Flutter, adhering to structured design methodologies.\nGitHub: MyWebsite';

  // Certifications
  static const certificationsTitle = 'Certifications';
  static const certifications = [
    'Flutter Advanced Course - Clean Architecture with MVVM',
    'Flutter Animations from Zero to Hero',
    'Complete Flutter Development Guide',
  ];

  // Languages
  static const languagesTitle = 'Languages';
  static const englishProficiency = 'English: Full Professional Proficiency';
  static const arabicProficiency = 'Arabic: Native Speaker';

  // Additional Strengths
  static const additionalStrengthsTitle = 'Additional Strengths';
  static const additionalStrengths = [
    'Excellent communication and collaboration skills.',
    'Problem-solving mindset with a focus on delivering high-quality solutions.',
    'Fast learner with the ability to adapt to new technologies.',
  ];
  static List<Degree> testDegrees = List.filled(
      6,
      Degree(
          title: 'test',
          grade: GradeDegree.ACCEPTED,
          startDate: DateTime(2001),
          endDate: DateTime(2002),
          school: 'test school'));
  static List<Course> testCorses = List.filled(
      5,
      Course(
          title: 'test Cors',
          startDate: DateTime(2001, 3),
          endDate: DateTime(2002, 4)));
  static List<ProjectExperience> testProjects = List.filled(
      5,
      ProjectExperience(
          title: 'project test',
          link: "www.test.com",
          description:
              'this is dis for project testttttt twetsdgsdg etwdsdgsadg teewtsdg wetdgdsg tewgsgsdg etsdgsdgsdwet dgsdgsdgwe dsgwe sdg gs rg sd sdgsdg weg sdge gdsg s sdg e gsd gsdgs '));
  static List<WorkExperience> testExperince = List.filled(
      6,
      WorkExperience(
          description: WordGenerator().randomSentence(20),
          title: 'test work expreince ',
          startDate: DateTime(2001, 4),
          endDate: DateTime(2002, 5)));
  static List<String> testSkills =
      List.filled(30, "Test skill hard 1212 tooooo looooooooooooong ");
}
