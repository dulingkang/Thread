//
//  ViewController.swift
//  Thread
//
//  Created by dulingkang on 15/12/22.
//  Copyright © 2015年 dulingkang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var threadManager: ThreadManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadManager = ThreadManager.init()
        threadManager.createQueue()
    }

}

