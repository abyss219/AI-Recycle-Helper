//
//  QuizViewController.swi
//  AI_Recycle_Helper
//
//  Created by R L on 2022-01-09.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var questionImage: UIImageView?
    
    @IBOutlet weak var questionExp: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var b5: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var hintButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    
  /*
    
    init(){
        buttonList=[];
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    var quiz = Quiz();
    
    
    
    var userSelectList:[String] = []
    
    //var questions=["1+2=5","2+6=7","3+1=4"]
    override func viewDidLoad() {
        super.viewDidLoad();
        updateUI()
        //questionImage!.image=#imageLiteral(resourceName: "Q1")
            
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hintButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHint", sender: self)
        
    }
    
    
    var goToNext = false;
    @IBAction func answerButtonIsPressed(_ sender: UIButton) {
        

        
        
        
        
        let buttonList=[self.b1,self.b2,self.b3,self.b4,self.b5];
        if (goToNext){
            updateUI();
            goToNext = false
        }else{
            var x = quiz.checkAns(userAnswer:userSelectList);
            
            if (!x){
                hintButton.alpha=1
                hintButton.isEnabled=true
            }

            var myquestion=quiz.questions[quiz.currentQustionNum]
            for i in 0...(myquestion.options.count-1){
                if myquestion.answers.contains(i) && userSelectList.contains(myquestion.options[i]){
                    //green
                    buttonList[5-myquestion.options.count+i]?.backgroundColor=UIColor(red: 227/255, green: 253/255, blue: 253/255, alpha: 1.0)
                    buttonList[5-myquestion.options.count+i]?.layer.cornerRadius=14
                    
                }else if (!myquestion.answers.contains(i) && !userSelectList.contains(myquestion.options[i])){
                    buttonList[5-myquestion.options.count+i]?.backgroundColor=UIColor.clear
                    buttonList[5-myquestion.options.count+i]?.layer.cornerRadius=14
                }else{
                    buttonList[5-myquestion.options.count+i]?.backgroundColor=UIColor(red: 255/255, green: 226/255, blue: 226/255, alpha: 1.0)
                    buttonList[5-myquestion.options.count+i]?.layer.cornerRadius=14
                }
   
            }
            
            
            goToNext = true;
        }
    }
    
    

    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToHint" {
                let destinationVC = segue.destination as! HintViewController
             destinationVC.hint = quiz.getHint()
            
            }else if segue.identifier == "goToFinishView"{
                let destinationVC = segue.destination as! FinishQuizViewController
                destinationVC.score = quiz.score
            }
    }
    func updateUI(){
        checkFinishView();
        
        
        hintButton.alpha=0
        hintButton.isEnabled=false
        scoreLabel.text = ("score: "+String(quiz.getScore()))
        
        progressBar.progress=Float(quiz.usedQuestion.count)/10.0;
       
        questionNumberLabel.text=("Question "+String(quiz.usedQuestion.count+1))

        //print(quiz.getScore())
        userSelectList = [];
        quiz.getQuestion();
        questionText.text = quiz.getQuestionText();
        let questionsOption = quiz.questions[quiz.currentQustionNum].options;
        let buttonList=[self.b1,self.b2,self.b3,self.b4,self.b5];
        if (quiz.questions[quiz.currentQustionNum].hasImage == true){
            questionImage!.image=#imageLiteral(resourceName: "Q"+String(quiz.currentQustionNum))
        }else{
            questionImage?.image=nil;
        }
        
        for i in 0...4{
            buttonList[i]?.setTitle(" ", for: .normal);
            buttonList[i]?.isEnabled=false;
            buttonList[i]?.alpha=0;
            buttonList[i]?.backgroundColor=UIColor.clear;
            buttonList[i]?.layer.cornerRadius=14
        }
        for index in 0...(questionsOption.count-1){
             buttonList[5-questionsOption.count+index]?.setTitle(questionsOption[index], for: .normal);
            buttonList[5-questionsOption.count+index]?.isEnabled=true;
            buttonList[5-questionsOption.count+index]?.alpha=1
        }
        
    }
    
    
    func checkFinishView(){
        if (quiz.usedQuestion.count==10){
            performSegue(withIdentifier: "goToFinishView", sender: self)
            quiz.score = 0
            quiz.usedQuestion=[];
        }
    }
    
    //Anamation
    @IBAction func userSelect(_ sender: UIButton) {
        if (!goToNext){
            if userSelectList.contains(sender.currentTitle!){
                userSelectList=userSelectList.filter(){$0 != sender.currentTitle!}
                sender.backgroundColor=UIColor.clear
            }else{
                if(userSelectList.count < quiz.questions[quiz.currentQustionNum].answers.count){
                    userSelectList.append(sender.currentTitle!)
                    sender.backgroundColor=UIColor(red: 134/255, green: 198/255, blue: 244/255, alpha: 1.0)
                }

            }
            //print(userSelectList)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
