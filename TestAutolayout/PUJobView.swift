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
        labelForMonth.textColor = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        labelForMonth.font = UIFont(name: AppConstants.RobotoLightFont, size: 12)
        labelForMonth.text = doj.substringToIndex(3)
        labelForMonth.backgroundColor = UIColor.redColor()
        viewForBackground.addSubview(labelForMonth)
        
        labelForMonth.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for month label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 15.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 10.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 32.0))

        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 15.0))
        
        
        // ----------------------------------------------------------------
        //   year label
        // ----------------------------------------------------------------
        let labelForYear = UILabel()
        labelForYear.textAlignment = NSTextAlignment.Right
        labelForYear.textColor = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        labelForYear.backgroundColor = UIColor.yellowColor()
        labelForYear.font = UIFont(name: AppConstants.RobotoLightFont, size: 12)
        labelForYear.text = doj.substringFromIndex(4)
        viewForBackground.addSubview(labelForYear)
        
        labelForYear.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for year label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 15.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: labelForMonth, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 4.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 32.0))

        self.addConstraint(NSLayoutConstraint(item: labelForYear, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 15.0))
        
        self.addConstraint(NSLayoutConstraint(item: labelForMonth, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        
        
        // ----------------------------------------------------------------
        //   image for company
        // ----------------------------------------------------------------
        let imageView = UIImageView(frame: CGRectMake(60.0, 6.0, 37.0, 37.0))
        imageView.image = companyImage
        imageView.backgroundColor = UIColor.greenColor()
        imageView.layer.cornerRadius = 37.0 / 2.0
        imageView.clipsToBounds = true
        viewForBackground.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;

        // ----------------------------------------------------------------
        //   constraints for imageview
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: labelForYear, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 5.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 37.0))
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: imageView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 37.0))

        
        // ----------------------------------------------------------------
        //   role label
        // ----------------------------------------------------------------
        let labelForRole = UILabel(frame: CGRectMake(115.0, 7.0, viewframe.size.width - 130.0, 20.0))
        labelForRole.textAlignment = NSTextAlignment.Left
        labelForRole.textColor = UIColor(red: 234.0/255.0, green: 83.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        labelForRole.font = UIFont(name: AppConstants.RobotoLightFont, size: 14)
        labelForRole.text = jobRole
        labelForRole.backgroundColor = UIColor.blueColor()
        viewForBackground.addSubview(labelForRole)
        
        labelForRole.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for role label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForRole, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 115.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForRole, attribute: NSLayoutAttribute.TopMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 8.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForRole, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForRole, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: viewframe.size.width - 130.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForRole, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForRole, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 20.0))
        
        
        // ----------------------------------------------------------------
        //   company label
        // ----------------------------------------------------------------
        let labelForCompany = UILabel()
        labelForCompany.textAlignment = NSTextAlignment.Left
        labelForCompany.textColor = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        labelForCompany.font = UIFont(name: AppConstants.RobotoLightFont, size: 14)
        labelForCompany.text = jobCompany
        labelForCompany.backgroundColor = UIColor.purpleColor()
        viewForBackground.addSubview(labelForCompany)
        
        labelForCompany.translatesAutoresizingMaskIntoConstraints = false;
        
        // ----------------------------------------------------------------
        //   constraints for role label
        // ----------------------------------------------------------------
        self.addConstraint(NSLayoutConstraint(item: labelForCompany, attribute: NSLayoutAttribute.LeadingMargin, relatedBy: NSLayoutRelation.Equal, toItem: viewForBackground, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 115.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForCompany, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: labelForRole, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 4.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForCompany, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: labelForCompany, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: viewframe.size.width - 130.0))
        
        
        self.addConstraint(NSLayoutConstraint(item: labelForCompany, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: labelForCompany, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 20.0))
    }
}
