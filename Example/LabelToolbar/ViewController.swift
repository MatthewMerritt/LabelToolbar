//
//  ViewController.swift
//  LabelToolbar
//
//  Created by MatthewMerritt on 05/07/2020.
//  Copyright (c) 2020 MatthewMerritt. All rights reserved.
//

import UIKit
import LabelToolbar

class ViewController: UIViewController {

    let labelToolbar = LabelToolbar()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        toolbarItems = labelToolbar.items
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        labelToolbar.setAttributedText(for: .left, title: "Left Title: ", detail: "10:00")
        labelToolbar.setAttributedText(for: .middle, title: "Middle Title: ", detail: "Click")
        labelToolbar.setAttributedText(for: .right, title: "Right Title: ", detail: "25")

        labelToolbar.middleButtonActionClosure = { label in
            print("Label: \(label) clicked!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

