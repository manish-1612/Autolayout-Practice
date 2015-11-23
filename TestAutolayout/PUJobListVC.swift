//
//  PUJobListVC.swift
//  TestAutolayout
//
//  Created by Manish Kumar on 23/11/15.
//  Copyright © 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class PUJobListVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var startOrigin : CGFloat?
    
    // MARK: - Constants -
    struct Identifier {
        static let SquareCashFlexibleHeightBar = "SquareCashFlexibleHeightBar"
        static let UnwindSquareCash = "UnwindSquareCash"
    }


    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        createHeaderView()
    }
    
    
    
    // MARK:- Header drawing methods
    func createHeaderView(){
        
        startOrigin  = 145.0
        
        //configure flexible bar
        configureFlexibleHeightBar()
        
    }
    
    
    
    
    var myCustomBar: SquareCashFlexibleHeightBar {
        get {
            if let customBar = _myCustomBar {
                return customBar
            }
            
            _myCustomBar = NSBundle.mainBundle().loadNibNamed(Identifier.SquareCashFlexibleHeightBar, owner: nil, options: nil)?.last as? SquareCashFlexibleHeightBar
            
            _myCustomBar?.configurebar(view.frame.size.width, headerTitle : "Job List" , descriptionString : "" , closeButtonAction: {
                self.navigationController?.popViewControllerAnimated(true)
                
                }, saveButtonAction: {
                    print("save VC")
                }, editbuttonAction: {
                    print("edit VC")
            })
            
            return _myCustomBar!
        }
    }
    var _myCustomBar: SquareCashFlexibleHeightBar?
    
    
    func configureFlexibleHeightBar(){
        
        self.view.addSubview(myCustomBar)
        myCustomBar.behaviorDefiner = SquareCashBarBehaviorDefiner()
        self.scrollView.delegate = myCustomBar.behaviorDefiner
    }

    
    override func viewWillAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewWillDisappear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidDisappear(animated: Bool) {
        //do as per your desire
    }
    
    // MARK :- Memory warning handling
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
