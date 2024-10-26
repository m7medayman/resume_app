import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resume_app/features/resume_dialog/data/gemini_repo/Request_model.dart';
import 'package:resume_app/features/resume_dialog/data/gemini_repo/schema_manager.dart';
import 'package:resume_app/features/resume_dialog/data/response_model.dart';

class JobDetailsServiceProvider {
  Future<JobDescriptionResponseModel> getSkills(String jobDescription) async {
    final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: 'AIzaSyC2P2cI_gI0P5gM0qXzilRb1J2nymgiXmg',
        // safetySettings: Adjust safety settings
        // See https://ai.google.dev/gemini-api/docs/safety-settings
        generationConfig: GenerationConfig(
            temperature: 1,
            topK: 64,
            topP: 0.95,
            maxOutputTokens: 8192,
            responseMimeType: 'application/json',
            responseSchema: SchemaManager.getJobDescriptionSchema()));

    final chat = model.startChat(history: []);
    final message = RequestModel.getJobDetailsRequest(jobDescription);
    final content = Content.text(message);

    final response = await chat.sendMessage(content);
    print(response.text);
    if (response.text == null || response.text!.isEmpty) {
      throw Exception("job description is null or empty");
    }
    Map<String, dynamic> responsefullMap = jsonDecode(response.text!);
    Map<String, dynamic> responseMap = responsefullMap["response"];
    return JobDescriptionResponseModel.fromJson(responseMap);
  }
}
