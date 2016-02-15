//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet weak var kao1: UIButton!
    @IBOutlet weak var kao2: UIButton!
    @IBOutlet weak var kao3: UIButton!
    @IBOutlet weak var kao4: UIButton!
    @IBOutlet weak var kao5: UIButton!
    @IBOutlet weak var kao6: UIButton!
    @IBOutlet weak var kao7: UIButton!
    @IBOutlet weak var kao8: UIButton!
    @IBOutlet weak var kao9: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func addSpace() {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    
    func addRet() {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    func addKao1() {
        (textDocumentProxy as UIKeyInput).insertText("(´｡• ᵕ •｡`) ♡")
    }
    
    func addKao2() {
        (textDocumentProxy as UIKeyInput).insertText("( ´ ▽ ` ).｡ｏ♡")
    }
    
    func addKao3() {
        (textDocumentProxy as UIKeyInput).insertText("♡ ～('▽^人)")
    }
    
    func addKao4() {
        (textDocumentProxy as UIKeyInput).insertText("(￣ε￣＠)")
    }
    
    func addKao5() {
        (textDocumentProxy as UIKeyInput).insertText("(≧◡≦) ♡")
    }
    
    func addKao6() {
        (textDocumentProxy as UIKeyInput).insertText("(￣▽￣*)ゞ")
    }
    
    func addKao7() {
        (textDocumentProxy as UIKeyInput).insertText("ψ(｀∇´)ψ")
    }
    
    func addKao8() {
        (textDocumentProxy as UIKeyInput).insertText("(・∀・)ノ")
    }
    
    func addKao9() {
        (textDocumentProxy as UIKeyInput).insertText("ヾ(☆'∀'☆) ")
    }
    
    func addHeart() {
        (textDocumentProxy as UIKeyInput).insertText("♡")
    }
    
    func backButtonPressed() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        switch proxy.documentContextBeforeInput {
        case let s where s?.hasSuffix("    ") == true: // Cursor in front of tab, so delete tab.
            for _ in 0..<4 { // TODO: Update to use tab setting.
                proxy.deleteBackward()
            }
        default:
            proxy.deleteBackward()
        }
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        spaceButton.addTarget(self, action: "addSpace", forControlEvents: .TouchUpInside)
        returnButton.addTarget(self, action: "addRet", forControlEvents: .TouchUpInside)
        kao1.addTarget(self, action: "addKao1", forControlEvents: .TouchUpInside)
        kao2.addTarget(self, action: "addKao2", forControlEvents: .TouchUpInside)
        kao3.addTarget(self, action: "addKao3", forControlEvents: .TouchUpInside)
        kao4.addTarget(self, action: "addKao4", forControlEvents: .TouchUpInside)
        kao5.addTarget(self, action: "addKao5", forControlEvents: .TouchUpInside)
        kao6.addTarget(self, action: "addKao6", forControlEvents: .TouchUpInside)
        kao7.addTarget(self, action: "addKao7", forControlEvents: .TouchUpInside)
        kao8.addTarget(self, action: "addKao8", forControlEvents: .TouchUpInside)
        kao9.addTarget(self, action: "addKao9", forControlEvents: .TouchUpInside)
        heartButton.addTarget(self, action: "addHeart", forControlEvents: .TouchUpInside)
        backButton.addTarget(self, action: "backButtonPressed", forControlEvents: .TouchUpInside)
        
        
    }


}
