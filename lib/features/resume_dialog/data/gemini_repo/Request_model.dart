class RequestModel {
  static getJobDetailsRequest(String jobDescription) {
    return "get form this job , key words that should be in the resume ,job name , required soft skills , required hard skills  : $jobDescription";
  }
}
