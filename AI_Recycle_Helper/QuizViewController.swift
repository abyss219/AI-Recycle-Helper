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
            if (quiz.usedQuestion.count==10){
                performSegue(withIdentifier: "goToFinishView", sender: self)
                quiz.score = 0
                quiz.usedQuestion=[];
       
                updateUI();

      
            }else{
                updateUI();
            }
            goToNext = false
        }else{
            var x = quiz.checkAns(userAnswer:userSelectList);
            scoreLabel.text = ("score: "+String(quiz.getScore()))
            if (!x){
                hintButton.alpha=1
                hintButton.isEnabled=true
            }

            var myquestion=quiz.questions[quiz.currentQustionNum]
            for i in 0...(myquestion.options.count-1){
                if myquestion.answers.contains(i) && userSelectList.contains(myquestion.options[i]){
                    //green
                    buttonList[i]?.backgroundColor=UIColor(named:"quizButtonCorrectColor")
                    buttonList[5-myquestion.options.count+i]?.layer.cornerRadius=35
                }else if (!myquestion.answers.contains(i) && !userSelectList.contains(myquestion.options[i])){
                    //buttonList[i]?.backgroundColor=UIColor.clear
                    buttonList[i]?.layer.cornerRadius=35
                }else{
                    buttonList[i]?.backgroundColor=UIColor(named:"quizButtonWrongColor")
                    buttonList[i]?.layer.cornerRadius=35
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
        progressBar.progress=Float(quiz.usedQuestion.count)/10.0;
        questionNumberLabel.text=("Question "+String(quiz.usedQuestion.count+1)+"/10")
        userSelectList = [];
        quiz.getQuestion();
        questionText.text = quiz.getQuestionText();
        let questionsOption = quiz.questions[quiz.currentQustionNum].options;
        let buttonList=[self.b1,self.b2,self.b3,self.b4,self.b5];
        if (quiz.questions[quiz.currentQustionNum].hasImage == true){
            questionImage!.image = #imageLiteral(resourceName: "Q"+String(quiz.currentQustionNum))
        }else{
            questionImage?.image=nil;
        }
 
        for i in 0...4{
       
            buttonList[i]?.isEnabled=false;
            buttonList[i]?.backgroundColor=UIColor(named: "quizDefaultButtonColor");
            // buttonList[i]?.setTitleColor(Rever, for:.normal)
            buttonList[i]?.isHidden=true;
        }
        for index in 0...(questionsOption.count-1){
           
            buttonList[index]?.setTitle(questionsOption[index], for: .normal);
            buttonList[index]?.isEnabled=true;
            buttonList[index]?.alpha=1
            buttonList[index]?.isHidden=false;
            buttonList[index]?.layer.cornerRadius=35
   
        }
        questionText.text = quiz.getQuestionText();
    }
    
    
    /*
    var runCount = 0

    Timer.scheduledTimer(withTimeInterval: 1.0, #selector(fireTime) repeats: true) { timer in
        runCount += 1
        print("timer")
        if runCount == 3 {
            timer.invalidate()
        }
    }
    
    
    */
    
    
    
    
    
    
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
                sender.backgroundColor=UIColor(named:"quizDefaultButtonColor")
            }else{
                if(userSelectList.count < quiz.questions[quiz.currentQustionNum].answers.count){
                    userSelectList.append(sender.currentTitle!)
                    sender.backgroundColor=UIColor(named: "quizButtonSelectColor")
                    //sender.setTitleColor(UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0),for:.normal)
                    
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
