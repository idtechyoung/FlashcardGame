//
//  ViewController.swift
//  FlashcardGame
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iDTech. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        
        setupCardUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCardUI() {
        questionTextView.text = CardCollection.instance.currentCard.question
        
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }

}

