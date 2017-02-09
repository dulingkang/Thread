//
//  ThreadManager.swift
//  Thread
//
//  Created by dulingkang on 15/12/22.
//  Copyright © 2015年 dulingkang. All rights reserved.
//

import Foundation


class ThreadManager: NSObject {
    
    override init(){
        super.init()
    }
    
    //MARK: - public method
    func createThread() {
        let thread = Foundation.Thread.init(target: self, selector: "printLog", object: nil)
        thread.name = "myThread"
        thread.start()
    }
    
    func createQueue() {
        let queue = OperationQueue()
        queue.name = "myQueue"
        queue.maxConcurrentOperationCount = 2
        let operation = BlockOperation { () -> Void in
            print("do operation1:", Foundation.Thread.current)
        }
        
        operation.addExecutionBlock { () -> Void in
            print("do operation2:", Foundation.Thread.current)
        }
        
        operation.addExecutionBlock { () -> Void in
            print("do operation3:", Foundation.Thread.current)
        }
        
        let operation2 = BlockOperation { () -> Void in
            print("do operation4:", Foundation.Thread.current)
        }
        
        queue.addOperation(operation)
        queue.addOperation(operation2)
        queue.addOperation { () -> Void in
            print("do operation5:", Foundation.Thread.current)
        }
    }
    
    //MARK: - private method
    fileprivate func printLog() {
        var a = 0
        repeat {
            a += 1
            print("times:",a)
            if a == 10 {
                print("stop")
                Foundation.Thread.current.cancel()
                break
            }
        } while (true)
    }

}
