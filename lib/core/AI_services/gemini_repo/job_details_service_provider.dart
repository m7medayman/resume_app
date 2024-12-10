import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resume_app/core/gemini/gemini.dart';
import 'package:resume_app/core/AI_services/gemini_repo/Request_model.dart';
import 'package:resume_app/core/AI_services/gemini_repo/schema_manager.dart';
import 'package:resume_app/core/AI_services/gemini_repo/response_model.dart';

class AiJobDetailsServiceProvider {
  Future<JobDescriptionResponseModel> getSkills(String jobDescription) async {
    final model = Gemini.getModel(SchemaManager.getJobDescriptionSchema());

    final chat = model.startChat(history: []);
    final message = RequestModel.getJobDetailsRequest(jobDescription);
    final content = Content.text(message);
    final response = await chat.sendMessage(content);

    if (response.text == null || response.text!.isEmpty) {
      throw Exception("job description is null or empty");
    }
    Map<String, dynamic> responsefullMap = jsonDecode(response.text!);
    Map<String, dynamic> responseMap = responsefullMap["response"];
    return JobDescriptionResponseModel.fromJson(responseMap);
  }

  Future<JobSummaryResponse> getJobSummary(
      String jobSummary, List<String> keyWords) async {
    final GenerativeModel model = Gemini.getModel(
      SchemaManager.getJobSummarySchema(),
    );

    final chat = model.startChat(history: []);
    final message = RequestModel.enhanceJobSummaryRequest(jobSummary, keyWords);
    final content = Content.text(message);
    final response = await chat.sendMessage(content);

    if (response.text == null || response.text!.isEmpty) {
      throw Exception("job Summary is null or empty");
    }
    Map<String, dynamic> responsefullMap = jsonDecode(response.text!);
    Map<String, dynamic> responseMap = responsefullMap["response"];
    return JobSummaryResponse.fromJson(responseMap);
  }

  Future<JobExperienceResponse> getJobExperience(String jobExperience) async {
    final GenerativeModel model =
        Gemini.getModel(SchemaManager.getJobExperience());

    final chat = model.startChat(history: []);
    final message = RequestModel.enhanceJobExperienceRequest(jobExperience);
    final content = Content.text(message);
    final response = await chat.sendMessage(content);

    if (response.text == null || response.text!.isEmpty) {
      throw Exception("job Experience is null or empty");
    }
    Map<String, dynamic> responsefullMap = jsonDecode(response.text!);
    Map<String, dynamic> responseMap = responsefullMap["response"];
    return JobExperienceResponse.fromJson(responseMap);
  }
}
