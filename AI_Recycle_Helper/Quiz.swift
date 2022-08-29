//
//  QuestionBank.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import Foundation


struct Quiz{
    var currentQustionNum=0; //index of questions
    var score = 0
    var usedQuestion:[Int]=[];
    let questions = [
        Question(questionText:"Styrofoam should be placed in your recycling bin/cart." , options: ["True","False"], answers: [1], hasImage: true, hint: "Styrofoam packaging and film plastics aren't accepted for collection. You can drop them at the Eco-Centre or take them to a Recycle BC drop-off location."),
        Question(questionText: "Batteries and small electronics go in your recycling bin/cart.", options: ["True","False"], answers: [1], hasImage: true,hint: "Most importantly, you want to keep electronics and rechargeable batteries out of your recycling and trash bin. This will help to prevent the serious threat of fires caused by sparks or explosions."),
        Question(questionText: "Recyclables should be loose and not bagged.", options: ["True","False"], answers: [0], hasImage: true,hint: "Loose materials help machine and recycling staff see items in the bin right away to pull out any non-recyclables as soon as possible."),
        Question(questionText: "Old garden hoses and electric cords belong in your recycling bin/cart.", options: ["Yes","No"], answers: [1], hasImage: true,hint: "garden hoses are tanglers, which can cause massive disruption."),
        Question(questionText: "All metal is recyclable - just put it in your recycling bin/cart at home. ", options: ["True", "False"], answers: [1], hasImage: true,hint: "In most cases, aluminum and tin can be safely recycled."),
        Question(questionText: "Which of the following plastic bottles are recyclable?", options: ["Only shampoo bottle",    "Only laundry detergent",    "Only dish soap",    "Only window cleaner", "All of above"], answers: [4], hasImage: true,hint: "Plastic bottles can be recycled."),
        Question(questionText: "You should not…", options: ["Place recycling in plastic bags and then putting them in the recycling bin.","Put recyclable items in the general rubbish bin.","Separate food scraps from pizza boxes before recycling."], answers: [0,1,2], hasImage: true,hint: "Follow recycling instructions."),
        Question(questionText: "Which of these materials can be disposed of in your recycling bin or cart?", options: ["Bug Killer","Batteries","Paint","none of the above"], answers: [3], hasImage: true,hint: "1"),
        Question(questionText: "Do you know what to do with plastic bags?", options: ["To be recycled, they need to go back to retail","Plastic bags can be recycled in my bin/cart"], answers: [0], hasImage: true,hint: "1"),
        Question(questionText: "Paper napkins go in which cart?", options: ["Trash Cart","Recycling Cart"], answers: [0], hasImage: true,hint: "This item is not acceptable for the recycle bin."),
        Question(questionText: "Polystyrene goes in which cart?", options: ["Trash Cart","Recycling Cart"], answers: [0], hasImage: true,hint: "Due to the low density of polystyrene foam, polystyrene is not often recyclable. The best way is to reuse it!"),
        Question(questionText: "Plastic hangers go in which cart?", options: ["Trash cart","Recycling Cart"], answers: [0], hasImage: true,hint: "They are generally not accepted in recycle bins. However, a local dry cleaner or thrift shop may be a possibility. "),
        Question(questionText: "Greasy cardboard goes in which cart?", options: ["Trash cart","Recycling Cart"], answers: [0], hasImage: true,hint: "If you have curbside paper recycling pickup, you may recycle this item."),
        Question(questionText: "True or False: Shredded paper can be recycled.", options: ["TRUE","FALSE"], answers: [0], hasImage: true,hint: "In British Columbia, paper shredding is incorporated in curbside recycling programmes. To prevent smaller bits from becoming a mess in your trash can, it is recommended to store shredded paper in a bag."),
        Question(questionText: "Shampoo and lotion bottles go in which cart?", options: ["Trash Cart","Recycling Cart"], answers: [1], hasImage: true,hint: "Plastic bottles can be recycled."),
        Question(questionText: "Should wrapping paper (foil) be placed in recycling bin?", options: ["Yes","No"], answers: [1], hasImage: true,hint: "This item is not acceptable for the recycle bin. It may be acceptable in your community's recycling or collection programme."),
        
        
        Question(questionText: "Gable-top cartons go in which cart?", options: ["Trash Cart","Recycling Cart"], answers: [1], hasImage: false, hint: "This item can go in your container recycling if you receive curbside recycling collection."),
        Question(questionText: "Disposable coffee cups go in which cart?", options: ["Trash Cart","Recycling Cart"], answers: [0], hasImage: false, hint: "This item can go in your container recycling if you receive curbside recycling collection."),
        Question(questionText: "Where can I recycle my empty bags and plastic containers for garden chemicals and fertilizers?", options: ["Trash Cart","Recycling Cart"], answers: [1], hasImage: false, hint: "Plastic pails or buckets for fertilizers, road salt, soil, and other garden products are included in a provincial recycling program through Recycle BC. Once these containers are empty and rinsed, they can be placed in many curbside recycling programs across the province. This includes all containers that are 25 litres or less in size."),
        Question(questionText: "Plastic bags are not accepted in the recycling bin.", options: ["TRUE","FALSE"], answers: [0], hasImage: false, hint: "Plastic bags and some plastic wraps are recyclable"),
        Question(questionText: "Lids & caps should be removed before recycling.", options: ["TRUE","FALSE"], answers: [0], hasImage: false, hint: "Most lids are constructed of a different sort of plastic than the containers. They often have a greater melting point and may disturb the whole batch of plastic that is being recycled. Always remove the lid from any plastic containers before recycling.")
    ]

    

    func getScore() -> Int{
        return score;
    }
    
    mutating func checkAns(userAnswer:[String])->Bool {
        var flag = true;
        var correctChoice = 0;
        
        for correctAns in questions[currentQustionNum].answers{
            if (userAnswer.contains(questions[currentQustionNum].options[correctAns])){
                correctChoice+=1
                //self.score += (10/(questions[currentQustionNum].answers.count));
            }else{
                flag = false
            }
        }
        self.score += correctChoice*10/questions[currentQustionNum].answers.count;
        return flag
    }
    

    
    func getQuestionText() ->String{
        return questions[currentQustionNum].questionText
    }
    


    
    mutating func getQuestion(){
        var nextQuestionNum = Int.random(in: 0..<questions.count)
        while (usedQuestion.contains(nextQuestionNum)){
            nextQuestionNum = Int.random(in: 0..<questions.count)
        }
        self.currentQustionNum = nextQuestionNum
        self.usedQuestion.append(nextQuestionNum)
    }
    

    
    func getHint() -> String{
        return questions[currentQustionNum].hint
    }
    
}
