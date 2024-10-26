import 'package:google_generative_ai/google_generative_ai.dart';

class SchemaManager {
  static Schema getJobDescriptionSchema() {
    return Schema(
      SchemaType.object,
      properties: {
        "response": Schema(
          SchemaType.object,
          properties: {
            "heardSkills": Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            "softSkills": Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            "jobTitle": Schema(SchemaType.string),
            "punchOfJobRequirement": Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            "punchOfKeyWords": Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
        ),
      },
    );
  }
}
