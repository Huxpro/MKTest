//
//  NewTodoViewController.swift
//  firstTodo
//
//  Created by Xuan Huang on 14/12/18.
//  Copyright (c) 2014年 Hux. All rights reserved.
//

import UIKit


protocol saveDelegate: NSObjectProtocol {
    func addTodo(data:String);
}

class NewTodoViewController: UIViewController {
    
    @IBOutlet weak var newText: MKTextField!
    
    var _delegate:TodoViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func onSave(sender: UIBarButtonItem) {
        var _data = newText.text;
        
        _delegate?.addTodo(_data);
        
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}
