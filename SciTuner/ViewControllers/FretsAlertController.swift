//
//  FretsAlertController.swift
//  SciTuner
//
//  Created by Denis Kreshikhin on 08.03.15.
//  Copyright (c) 2015 Denis Kreshikhin. All rights reserved.
//

import Foundation
import UIKit

protocol FretsAlertControllerDelegate: class {
    func didChange(fret: Fret)
}

class FretsAlertController: UIAlertController {
    weak var parentDelegate: FretsAlertControllerDelegate?
    
    override func viewDidLoad() {
        Fret.allFrets.forEach { self.add(fret: $0) }
        
        addAction(UIAlertAction(title: "cancel".localized(), style: .cancel, handler: nil))
    }
    
    func add(fret: Fret){
        let action = UIAlertAction(
            title: fret.localized(), style: .default,
            handler: {(action: UIAlertAction) -> Void in
                self.parentDelegate?.didChange(fret: fret)
        })
        
        addAction(action)
    }
}
