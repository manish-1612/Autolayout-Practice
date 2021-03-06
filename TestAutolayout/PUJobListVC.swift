//
//  PUJobListVC.swift
//  TestAutolayout
//
//  Created by Manish Kumar on 23/11/15.
//  Copyright © 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class PUJobListVC: UIViewController {
    
    @IBOutlet weak var heightConstraintForViewForSeparator: NSLayoutConstraint!
    @IBOutlet weak var horizontalConstraintForScrollviewContentWidth: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraintForScrollviewContentHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
   
    var startOrigin : CGFloat?
    
    @IBOutlet weak var viewForSeparatorBelowButton: UIView!
    @IBOutlet weak var buttonToAdd: UIButton!
    
    var arrayForJobList = [AnyObject]()
    
    
    // MARK: - Constants -
    struct Identifier {
        static let SquareCashFlexibleHeightBar = "SquareCashFlexibleHeightBar"
        static let UnwindSquareCash = "UnwindSquareCash"
    }


    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        heightConstraintForViewForSeparator.constant = 1.0
        
        
        let dictionaryForJob1 = ["name" : "Innofied Solutions Pvt. Ltd.", "role" : "Manager", "doj" : "Nov 2017", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]
        let dictionaryForJob2 = ["name" : "FHCD Solution Ltd.", "role" : "Project Manager", "doj" : "Jun 2016", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]
        let dictionaryForJob3 = ["name" : "My Apps Ltd.", "role" : "Team Leader", "doj" : "Jul 2015", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]
        let dictionaryForJob4 = ["name" : "King Soft", "role" : "Software Engineer", "doj" : "Apr 2014", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]
        let dictionaryForJob5 = ["name" : "ABC software Solution Pvt. Ltd.", "role" : "Junior Developer", "doj" : "Jan 2013", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]
        let dictionaryForJob6 = ["name" : "Deel Software Solution", "role" : "Trainee", "doj" : "May 2012", "image" : Utility.getImageWithColor(UIColor.redColor(), size: CGSizeMake(37.0, 37.0))]

        arrayForJobList.append(dictionaryForJob1)
        arrayForJobList.append(dictionaryForJob2)
        arrayForJobList.append(dictionaryForJob3)
        arrayForJobList.append(dictionaryForJob4)
        arrayForJobList.append(dictionaryForJob5)
        arrayForJobList.append(dictionaryForJob6)
        
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
        
        createViewForJobList()
    }

    
    func createViewForJobList(){
                
        var arrayForOrigin = [CGFloat]()
        arrayForOrigin.append(buttonToAdd.frame.origin.y + buttonToAdd.frame.size.height + 22.0)
        
        for i in 0..<arrayForJobList.count{
            
            let job = arrayForJobList[i]
            
            let viewForJob = PUJobView(frame: CGRectMake(0.0, arrayForOrigin[i], self.view.frame.size.width, 50.0), role: (job["role"] as? String)!, company: (job["name"] as? String)!, date: (job["doj"] as? String)!, image: (job["image"] as? UIImage)!)
            viewForJob.backgroundColor = UIColor.whiteColor()
            scrollView.addSubview(viewForJob)
            scrollView.bringSubviewToFront(viewForJob)

            let heightToAppend = viewForJob.frame.origin.y + viewForJob.frame.size.height + 33.0
            
            arrayForOrigin.append(heightToAppend)
            
            heightConstraintForViewForSeparator.constant = arrayForOrigin.last! - viewForSeparatorBelowButton.frame.origin.y
        }
        
        bottomConstraintForScrollviewContentHeight.constant = 0.0
        
        horizontalConstraintForScrollviewContentWidth.constant = self.view.frame.size.width - viewForSeparatorBelowButton.frame.origin.x - 10.0
        
        
        if viewForSeparatorBelowButton.frame.origin.y + heightConstraintForViewForSeparator.constant < self.view.frame.size.height {
            heightConstraintForViewForSeparator.constant = self.view.frame.size.height  - viewForSeparatorBelowButton.frame.origin.y
        }
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
