import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini {
  static String ApiKey = 'AIzaSyC2P2cI_gI0P5gM0qXzilRb1J2nymgiXmg';

  static GenerativeModel getmodel(Schema? responseSchema) {
    return GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: ApiKey,
        // safetySettings: Adjust safety settings
        // See https://ai.google.dev/gemini-api/docs/safety-settings
        generationConfig: GenerationConfig(
            temperature: 1,
            topK: 64,
            topP: 0.95,
            maxOutputTokens: 8192,
            responseMimeType: 'application/json',
            responseSchema: responseSchema));
  }
}