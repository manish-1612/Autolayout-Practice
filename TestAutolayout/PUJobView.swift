//
//  PUJobView.swift
//  TestAutolayout
//
//  Created by Manish Kumar on 23/11/15.
//  Copyright © 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class PUJobView: UIView {
    
    
    init(frame: CGRect , role : String, company : String , date : String, image : UIImage){
        super.init(frame : frame)
        
        createViewForJob(frame, jobRole: role, jobCompany: company, dateOfJoining: date, companyImage: image)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func createViewForJob(viewframe: CGRect , jobRole : String, jobCompany : String , dateOfJoining : String, companyImage : UIImage){
        
        let viewForBackground = UIView(frame: CGRectMake(viewframe.origin.x, 0.0, viewframe.size.width, viewframe.size.height))
        viewForBackground.backgroundColor = UIColor.clearColor()
        self.addSubview(viewForBackground)
        
        let doj : NSString = dateOfJoining
        
        // ----------------------------------------------------------------
        //   month label
        // ----------------------------------------------------------------
        let labelForMonth = UILabel()
        labelForMonth.textAlignment = NSTextAlignment.Right
        labelForMonth.textColor = UIColor.blackColor()
        labelForMonth.font = UIFont(name: AppConstants.RobotoLightFont, size: 12)
        labelForMonth.text = doj.substringToIndex(3)
        labelForMonth.backgroundColor = UIColor.blueColor()
        viewForBackground.addSubview(labelForMonth)
        
        labelForMonth.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for month label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 10.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 9.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 32.0))

        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 15.0))
        
        
        // ----------------------------------------------------------------
        //   year label
        // ----------------------------------------------------------------
        let labelForYear = UILabel()
        labelForYear.textAlignment = NSTextAlignment.Right
        labelForYear.textColor = UIColor.blackColor()
        labelForYear.backgroundColor = UIColor.yellowColor()
        labelForYear.font = UIFont(name: AppConstants.RobotoLightFont, size: 12)
        labelForYear.text = doj.substringFromIndex(4)
        viewForBackground.addSubview(labelForYear)
        
        labelForYear.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for year label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 10.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 20.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 32.0))

        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 15.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        
        
        
        // ----------------------------------------------------------------
        //   image for company
        // ----------------------------------------------------------------
        let image = UIImageView(frame: CGRectMake(50.0, 5.0, 37.0, 37.0))
        image.image = companyImage
        image.backgroundColor = UIColor.redColor()
        image.layer.cornerRadius = 37.0 / 2.0
        image.clipsToBounds = true
        viewForBackground.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false;

        // ----------------------------------------------------------------
        //   constraints for imageview
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 50.0))
        
//        self.addConstraint(NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 5.0))
//        
//        self.addConstraint(NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: image, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 37.0))
//        
//        self.addConstraint(NSLayoutConstraint(item: image, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: image, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 37.0))
//        
        
        print("image view frame : \(image.frame)")
    }
}
