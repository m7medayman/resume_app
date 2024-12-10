class RequestModel {
  static getJobDetailsRequest(String jobDescription) {
    return "get form this job , key words that should be in the resume ,job name , required soft skills , required hard skills  : $jobDescription";
  }

  static enhanceJobSummaryRequest(String jobSummary, List<String> keyWords) {
    return "enhance that job summary to use this keyWords: $keyWords ,job summary : $jobSummary, /n output in about 100 word";
  }

  static enhanceJobExperienceRequest(String jobExperience) {
    return "enhance that job Experience ,job Experience : $jobExperience";
  }
}
