//
//  IntentViewController.swift
//  IntentUI
//
//  Created by George Dan on 15/06/2016.
//  Copyright © 2016 ninjaprawn. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
        if let completion = completion {
            completion(CGSize(width: 0, height: 0))
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
