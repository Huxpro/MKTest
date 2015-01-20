//
//  TodoViewController.swift
//  firstTodo
//
//  Created by Xuan Huang on 14/12/18.
//  Copyright (c) 2014年 Hux. All rights reserved.
//

import UIKit

class Todo {
    var text:String =  ""
    var done:Bool =  false
    
    init(_text:String){
    
        self.text = _text
    }
}


class TodoViewController: UITableViewController {
    
    // Model - Collection
    var todoList = [Todo]();
    
    // Sample Model
    func makeSampleData() {
//        for i in 1...4 {
//            todoList.append(Todo())
//        }
//        todoList[0].text = "1"
//        todoList[1].text = "2"
//        todoList[2].text = "3"
//        todoList[3].text = "4"
        
        todoList.append(Todo(_text:"吃饭"));
        todoList.append(Todo(_text:"睡觉"));
        todoList.append(Todo(_text:"打豆豆"));
        todoList.append(Todo(_text:"Merry Christmas!"));
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // init View
        tableView.rowHeight = 65
        tableView.sectionHeaderHeight = 2

        
        
        // init Model
        makeSampleData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 表格分节
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "2014-01-02"
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
        //return 1000
    }
    
    // init Cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Identifier
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell") as MKTableViewCell
        cell.rippleLocation = .TapLocation;
        cell.circleLayerColor = UIColor.MKColor.LightBlue;

        
        // viewWithTag
        let cellLabel = cell.viewWithTag(1000) as UILabel
        
        //cellLabel.text = "What's This \(indexPath.row)";
        
        cellLabel.text = todoList[indexPath.row].text;
        
        return cell;
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        
        NSLog("\(indexPath)")
        
        let cellLabel = cell.viewWithTag(1000) as UILabel
        let checkbox = cell.viewWithTag(2) as UIImageView;
        
        if(cell.accessoryType == .Checkmark) {
            cell.accessoryType = .None
            checkbox.image = UIImage(named: "ic_element_checkbox_normal")
            let cellLabel = cell.viewWithTag(1000) as UILabel
            cellLabel.textColor = UIColor.blackColor();

        } else {
            cell.accessoryType = .Checkmark
            checkbox.image = UIImage(named: "ic_element_checkbox_pressed")
            let cellLabel = cell.viewWithTag(1000) as UILabel
            cellLabel.textColor = UIColor.lightGrayColor();
        }
    }
    
    // 卧槽这个都自带了啊
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // delete model
        todoList.removeAtIndex(indexPath.row);
        
        // delete view
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Left)
        
    }
    
    // add Todo 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var _secondView:NewTodoViewController = segue.destinationViewController as NewTodoViewController
        
        _secondView._delegate = self;
        
    }
    
    
    func addTodo(data: String) {
        NSLog("add!");
        todoList.append(Todo(_text:data));
    }
}

