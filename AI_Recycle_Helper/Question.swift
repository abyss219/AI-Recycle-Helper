//
//  Question.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import Foundation


struct Question {
    let questionText:String;
    let options:[String];
    let answers:[Int];
    let hasImage:Bool;
    let hint:String;
     // Add image and reason
    init(questionText:String,options:[String],answers:[Int],hasImage:Bool,hint:String){
        self.options=options
        self.answers=answers
        self.questionText=questionText
        self.hasImage=hasImage
        self.hint=hint
    }
    
}
