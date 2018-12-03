//
//  ViewController.swift
//  KnoeledgeKing
//
//  Created by User01 on 2018/12/3.
//  Copyright © 2018 00557146. All rights reserved.
//

import UIKit
struct questionStruct {
    var question:String
    var choose:[String]=[]
    var answer:Int
    var selected:Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    var count=1
    var point=0
    var timer=Timer()
    var timerCount=10
    var questionArray:[questionStruct]=[]
    var randomQuestionArray:[questionStruct]=[]
    
    func setQuestionDatabase() {
        questionArray.append(questionStruct(question:"下列哪位球員曾創下單場81分的神蹟？", choose:["LeBron James","Kobe Bryant","Michael Jordan","Kevin Durant"], answer: 2, selected:false))
        questionArray.append(questionStruct(question:"NBA現役最老的球員是？", choose:["Dirk Nowitzki","Pau Gasol","Vince Carter","Manu Ginobili"], answer: 3, selected:false))
        questionArray.append(questionStruct(question:"下列哪位球員是目前史上最年輕MVP?", choose:["Derrick Rose","James Harden","Steve Nash","Tim Duncan"], answer: 1, selected:false))
        questionArray.append(questionStruct(question:"NBA傳奇巨星Michael Jordan曾拿過幾次總冠軍？", choose:["3","4","5","6"], answer: 4, selected:false))
        questionArray.append(questionStruct(question:"下列哪項籃球規則屬於「違例」?", choose:["妨礙中籃","阻擋","打手","推人"], answer: 1, selected:false))
        questionArray.append(questionStruct(question:"NBA單場比賽時間為何?", choose:["4節,每節15分鐘","4節,每節12分鐘","4節,每節10分鐘","4節,每節8分鐘"], answer: 2, selected:false))
        questionArray.append(questionStruct(question:"下列哪位球員曾連續兩季達成場均大三元紀錄?", choose:["Jason Kidd","Oscar Robertson","Russell Westbrook","Magic Johnson"], answer: 3, selected:false))
        questionArray.append(questionStruct(question:"華裔球員林書豪曾帶領紐約尼克隊拿下幾連勝，並掀起林來瘋?", choose:["5","6","7","8"], answer: 3, selected:false))
        questionArray.append(questionStruct(question:"華裔球員林書豪未曾待過下列哪支球隊?", choose:["金州勇士","夏洛特黃蜂","布魯克林籃網","華盛頓巫師"], answer: 4, selected:false))
        questionArray.append(questionStruct(question:"下列哪支球隊拿下今年(17-18賽季)NBA總冠軍?", choose:["波士頓賽爾提克","聖安東尼奧馬刺","克里夫蘭騎士","金州勇士"], answer: 4, selected:false))
        questionArray.append(questionStruct(question:"下列哪位球員曾單節拿下37分，為目前單節最高分的紀錄保持者?", choose:["Michael Jordan","Klay Thompson","Kobe Bryant","Carmelo Anthony"], answer: 2, selected:false))
        questionArray.append(questionStruct(question:"下列哪位球員單場投進最多三分球?", choose:["Stephen Curry","James Harden","Damian Lillard","Klay Thompson"], answer: 4, selected:false))
        questionArray.append(questionStruct(question:"請問NBA主播常說的“From the downtown“是指球員投出了什麼球?", choose:["三分球","壓哨球","指叉球","罰球"], answer: 1, selected:false))
        questionArray.append(questionStruct(question:"請問華裔球員林書豪所司職的控球後衛英文縮寫為何?", choose:["PG","SG","FG","CG"], answer: 1, selected:false))
        questionArray.append(questionStruct(question:"下列何者不是NBA球隊?", choose:["明尼蘇達灰狼","芝加哥小熊","紐奧良鵜鶘","亞特蘭大老鷹"], answer: 2, selected:false))
        questionArray.append(questionStruct(question:"下列何者為NBA球隊?", choose:["休士頓太空人","休士頓地球人","休士頓火箭","休士頓宇宙"], answer: 3, selected:false))
        questionArray.append(questionStruct(question:"下列何者為NBA球隊?", choose:["費城巨人","費城費城人","費城86人","費城76人"], answer: 4, selected:false))
        questionArray.append(questionStruct(question:"下列何者為NBA球員?", choose:["Giannis Antetokounmpo","Tiger Woods","Roger Federer","Usain Bolt"], answer: 2, selected:false))
        questionArray.append(questionStruct(question:"NBA主播曾用“Too big,too strong,too fast,too good.”形容誰?", choose:["Kyrie Irving","John Wall","Derrick Rose","Russell Westbrook"], answer: 3, selected:false))
        questionArray.append(questionStruct(question:"下列哪支NBA球隊主場不位於美國境內?", choose:["暴龍","公鹿","公牛","老鷹"], answer: 1, selected:false))
        questionArray.append(questionStruct(question:"下列哪位球員為單季三分球進球數最多的紀錄保持人?", choose:["Ray Allen","Stephen Curry","Reggie Miller","Klay Thompson"], answer: 2, selected:false))
    }
    
    func ramdomNumber()
    {
        while  randomQuestionArray.count<=10{
            
            let number = Int.random(in: 0...questionArray.count-1)
            if(questionArray[number].selected==false){
                randomQuestionArray.append(questionArray[number])
                questionArray[number].selected=true
            }
        }
        print(randomQuestionArray)
    }
    func getQuestion()
    {
        questionNumber.text="Q"+String(count)
        question.text=randomQuestionArray[count-1].question
        buttonA.setTitle(randomQuestionArray[count-1].choose[0], for:UIControl.State.normal)
        buttonB.setTitle(randomQuestionArray[count-1].choose[1], for:UIControl.State.normal)
        buttonC.setTitle(randomQuestionArray[count-1].choose[2], for:UIControl.State.normal)
        buttonD.setTitle(randomQuestionArray[count-1].choose[3], for:UIControl.State.normal)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestionDatabase()
        ramdomNumber()
        getQuestion()
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if((sender==buttonA&&randomQuestionArray[count-1].answer==1)||(sender==buttonB&&randomQuestionArray[count-1].answer==2)||(sender==buttonC&&randomQuestionArray[count-1].answer==3)||(sender==buttonD&&randomQuestionArray[count-1].answer==4)) {
            point = point + 10
            score.text=String(point)
        }
        
        timerCount = 10;
        count = count + 1
        if (count <= 10){
            getQuestion()
        }
        else{
            buttonA.isEnabled=false
            buttonB.isEnabled=false
            buttonC.isEnabled=false
            buttonD.isEnabled=false
            restartButton.isEnabled=true
            restartButton.isHidden=false
        }
    }
    
    @IBAction func restartClick(_ sender: Any) {
        for i in (0...questionArray.count-1) {
            questionArray[i].selected=false
        }
        randomQuestionArray.removeAll()
        ramdomNumber()
        count=1
        getQuestion()
        point=0;
        score.text=String(point)
        buttonA.isEnabled=true
        buttonB.isEnabled=true
        buttonC.isEnabled=true
        buttonD.isEnabled=true
        restartButton.isEnabled=false
        restartButton.isHidden=true
    }
}
