import 'dart:convert';
import 'dart:developer';

class Charity {
    String? id;
    String nomInterviewer;
    String nomInterviewee;
    String question;
    String reponse;
    int? v;

    Charity({
        this.id,
        required this.nomInterviewer,
        required this.nomInterviewee,
        required this.question,
        required this.reponse,
        this.v,
    });


    factory Charity.fromJson(Map<String, dynamic> json) => Charity(
        id: json["_id"],
        nomInterviewer: json["nom_interviewer"],
        nomInterviewee: json["nom_interviewee"],
        question: json["question"],
        reponse: json["reponse"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson()=> {
        "interviewId": '$id',
        "nom_interviewer": nomInterviewer,
        "nom_interviewee": nomInterviewee,
        "question": question,
        "reponse": reponse,
    };
}
