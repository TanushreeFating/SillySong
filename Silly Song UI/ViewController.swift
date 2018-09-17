//
//  ViewController.swift
//  Silly Song UI
//
//  Created by Tanushree Fatinge on 9/5/18.
//  Copyright © 2018 Mindbody. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name: String) -> String {
    let vowels = CharacterSet(charactersIn: "aeiou")
    let lowercaseName = name.lowercased()
    
    var shortName = ""
    if let rangeOfFirstVowel = lowercaseName.rangeOfCharacter(from: vowels) {
        //shortName = lowercaseName.substring(from: rangeOfFirstVowel.lowerBound)
        shortName = String(lowercaseName.suffix(from: rangeOfFirstVowel.lowerBound))
    } else {
        shortName = lowercaseName
    }
    
    return shortName
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lyricsView: UITextView!
    
    @IBOutlet weak var nameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
       nameField.autocapitalizationType = UITextAutocapitalizationType.sentences
        nameField.returnKeyType = UIReturnKeyType.done
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "3.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
       
        nameField.text = ""
        lyricsView.text = ""
    }
   
    @IBAction func displayLyrics(_ sender: Any) {
        
        if let name = nameField.text {
            if name != "" {
                lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
            }
        }
        
        
    }
    
    
}
























