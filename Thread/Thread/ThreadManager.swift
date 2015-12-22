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
        let thread = NSThread.init(target: self, selector: "printLog", object: nil)
        thread.name = "myThread"
        thread.start()
    }
    
    func createQueue() {
        let queue = NSOperationQueue()
        queue.name = "myQueue"
        queue.maxConcurrentOperationCount = 2
        let operation = NSBlockOperation { () -> Void in
            print("do operation1:", NSThread.currentThread())
        }
        
        operation.addExecutionBlock { () -> Void in
            print("do operation2:", NSThread.currentThread())
        }
        
        operation.addExecutionBlock { () -> Void in
            print("do operation3:", NSThread.currentThread())
        }
        
        let operation2 = NSBlockOperation { () -> Void in
            print("do operation4:", NSThread.currentThread())
        }
        
        queue.addOperation(operation)
        queue.addOperation(operation2)
        queue.addOperationWithBlock { () -> Void in
            print("do operation5:", NSThread.currentThread())
        }
    }
    
    //MARK: - private method
    private func printLog() {
        var a = 0
        repeat {
            a++
            print("times:",a)
            if a == 10 {
                print("stop")
                NSThread.currentThread().cancel()
                break
            }
        } while (true)
    }

}