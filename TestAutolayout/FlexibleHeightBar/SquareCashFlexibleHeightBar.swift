//
//  SquareCashFlexibleHeightBar.swift
//  FlexibleHeightBarDemo
//
//  Modified and converted to swift by Vicente Suarez on 8/11/15.
//  Copyright © 2015 Vicente Suarez. All rights reserved.
//

/*
Copyright (c) 2015, Bryan Keller. All rights reserved.
Licensed under the MIT license <http://opensource.org/licenses/MIT>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portionsof the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/


import UIKit

class SquareCashFlexibleHeightBar: FlexibleHeightBar {
    
    private struct Constraints {
        static let maximumBarHeight: CGFloat = 114.0
        static let minimumBarHeight: CGFloat = 70.0
    }
    
    var isDescriptionPresent : Bool = false
    var descriptionStringInHeader : String?

    
    // MARK: - Properties -
    
    var closeButtonPressedClosure: (()->())?
    var saveButtonPressedClosure: (()->())?
    var editButtonPressedClosure: (()->())?
    
    // MARK: - IBOutlets -
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    var labelForDescription : UILabel!
    
    func configurebar(viewWidth: CGFloat, headerTitle : String, descriptionString : String , closeButtonAction: (()->()), saveButtonAction : (() -> ()), editbuttonAction : (() -> ())) {
        frame = CGRectMake(0, 0, viewWidth, 100.0)
        
        if descriptionString.characters.count > 0{
            // Configure bar appearance
            maximumBarHeight = 175.0
            minimumBarHeight = Constraints.minimumBarHeight
            descriptionStringInHeader = descriptionString
            isDescriptionPresent = true
        }else{
            // Configure bar appearance
            maximumBarHeight = Constraints.maximumBarHeight
            minimumBarHeight = Constraints.minimumBarHeight
            isDescriptionPresent = false
        }
        
        nameLabel.text = headerTitle
        
        if isDescriptionPresent {
            configureNameLabelAccordingToDescription()
        }else{
            configureNameLabel()
        }
        
        
        configureCloseButton()
        
        behaviorDefiner = SquareCashBarBehaviorDefiner()
        closeButtonPressedClosure = closeButtonAction
        saveButtonPressedClosure = saveButtonAction
        editButtonPressedClosure = editbuttonAction
    }
    
    
    private func configureNameLabel() {
        
        //set font for name label
        nameLabel.font = UIFont(name:AppConstants.RobotoLightFont, size: 23.0)
        
        //initializing layout attributes
        let initialLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes()
        initialLabelLayoutAttributes.size = nameLabel.sizeThatFits(CGSizeZero)
        initialLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, maximumBarHeight - 30.0)
        initialLabelLayoutAttributes.transform = CGAffineTransformMakeScale(1.0, 1.0)
        addLayoutAttributes(initialLabelLayoutAttributes, forSubview: nameLabel, forProgress: 0.0)
        
        let midwayNameLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: initialLabelLayoutAttributes)
        midwayNameLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, (maximumBarHeight - minimumBarHeight) * 0.4 + minimumBarHeight - 30.0)
        midwayNameLabelLayoutAttributes.transform = CGAffineTransformMakeScale(0.9, 0.9)
        addLayoutAttributes(midwayNameLabelLayoutAttributes, forSubview: nameLabel, forProgress: 0.5)
        
        let finalNameLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: midwayNameLabelLayoutAttributes)
        finalNameLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, minimumBarHeight - 25.0)
        finalNameLabelLayoutAttributes.transform = CGAffineTransformMakeScale(0.8, 0.8)
        editButton.alpha = 0.5
        addLayoutAttributes(finalNameLabelLayoutAttributes, forSubview: nameLabel, forProgress: 1.0)
        
        configureEditButton()
 
    }
    
    
    private func configureNameLabelAccordingToDescription(){
        
        //set font for name label
        nameLabel.font = UIFont(name:AppConstants.RobotoLightFont, size: 23.0)
        
        //initializing layout attributes
        let initialLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes()
        initialLabelLayoutAttributes.size = nameLabel.sizeThatFits(CGSizeZero)
        initialLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, maximumBarHeight - 85.0)
        initialLabelLayoutAttributes.transform = CGAffineTransformMakeScale(1.0, 1.0)
        addLayoutAttributes(initialLabelLayoutAttributes, forSubview: nameLabel, forProgress: 0.0)
        
        let midwayNameLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: initialLabelLayoutAttributes)
        midwayNameLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, (maximumBarHeight - minimumBarHeight) * 0.4 + minimumBarHeight - 55.0)
        midwayNameLabelLayoutAttributes.transform = CGAffineTransformMakeScale(0.9, 0.9)
        addLayoutAttributes(midwayNameLabelLayoutAttributes, forSubview: nameLabel, forProgress: 0.5)
        
        let finalNameLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: midwayNameLabelLayoutAttributes)
        finalNameLabelLayoutAttributes.center = CGPointMake(frame.size.width / 2.0, minimumBarHeight - 25.0)
        finalNameLabelLayoutAttributes.transform = CGAffineTransformMakeScale(0.8, 0.8)
        editButton.alpha = 0.5
        addLayoutAttributes(finalNameLabelLayoutAttributes, forSubview: nameLabel, forProgress: 1.0)
        
        configureEditButtonWithDescriptionString()
        

    }
    
    private func configureCloseButton() {
        saveButton.frame = CGRectMake(frame.size.width - 82.0, saveButton.frame.origin.y, saveButton.frame.size.width , saveButton.frame.size.height)
        saveButton.titleLabel?.font = UIFont(name: AppConstants.RobotoRegularFont, size: 13.0)
    }
    
    private func configureEditButton() {
        
        //get label constraints
        let labelWidth : CGFloat = getWidthOfLabelWith(nameLabel.font, text: nameLabel.text!)
        
        
        //initializing layout attributes
        let initialEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes()
        initialEditButtonLayoutAttributes.size = editButton.sizeThatFits(CGSizeZero)
        initialEditButtonLayoutAttributes.center = CGPointMake(nameLabel.center.x + labelWidth/2.0 + 20.0 , maximumBarHeight - 27.0)
        initialEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(1.0, 1.0)
        addLayoutAttributes(initialEditButtonLayoutAttributes, forSubview: editButton, forProgress: 0.0)

        let midwayEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: initialEditButtonLayoutAttributes)
        midwayEditButtonLayoutAttributes.center = CGPointMake(nameLabel.center.x + labelWidth/2.0 + 15.0, (maximumBarHeight - minimumBarHeight) * 0.4 + minimumBarHeight - 27.0)
        midwayEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(0.5, 0.5)
        addLayoutAttributes(midwayEditButtonLayoutAttributes, forSubview: editButton, forProgress: 0.5)
        
        let finalEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: midwayEditButtonLayoutAttributes)
        finalEditButtonLayoutAttributes.center = CGPointMake( nameLabel.center.x + labelWidth/2.0 + 10.0, minimumBarHeight - 25.0)
        finalEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(0.0, 0.0)
        addLayoutAttributes(finalEditButtonLayoutAttributes, forSubview: editButton, forProgress: 1.0)

    }
    
    
    private func configureEditButtonWithDescriptionString() {
        
        //get label constraints
        let labelWidth : CGFloat = getWidthOfLabelWith(nameLabel.font, text: nameLabel.text!)
        
        
        //initializing layout attributes
        let initialEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes()
        initialEditButtonLayoutAttributes.size = editButton.sizeThatFits(CGSizeZero)
        initialEditButtonLayoutAttributes.center = CGPointMake(nameLabel.center.x + labelWidth/2.0 + 20.0 , maximumBarHeight - 82.0)
        initialEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(1.0, 1.0)
        addLayoutAttributes(initialEditButtonLayoutAttributes, forSubview: editButton, forProgress: 0.0)
        
        let midwayEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: initialEditButtonLayoutAttributes)
        midwayEditButtonLayoutAttributes.center = CGPointMake(nameLabel.center.x + labelWidth/2.0 + 15.0, (maximumBarHeight - minimumBarHeight) * 0.4 + minimumBarHeight - 55.0)
        midwayEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(0.5, 0.5)
        addLayoutAttributes(midwayEditButtonLayoutAttributes, forSubview: editButton, forProgress: 0.5)
        
        let finalEditButtonLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: midwayEditButtonLayoutAttributes)
        finalEditButtonLayoutAttributes.center = CGPointMake( nameLabel.center.x + labelWidth/2.0 + 10.0, minimumBarHeight - 25.0)
        finalEditButtonLayoutAttributes.transform = CGAffineTransformMakeScale(0.0, 0.0)
        addLayoutAttributes(finalEditButtonLayoutAttributes, forSubview: editButton, forProgress: 1.0)
        
        configureDescriptionString()
    }

    
        func configureDescriptionString(){
        //create description Label
        labelForDescription = UILabel(frame: CGRectMake(0.0, maximumBarHeight - 60.0, self.frame.size.width, 20.0))
        labelForDescription.font = UIFont(name:AppConstants.RobotoLightFont, size: 14.0)
        labelForDescription.textAlignment = NSTextAlignment.Center
        labelForDescription.textColor = UIColor.whiteColor()
        labelForDescription.backgroundColor = UIColor.clearColor()
        labelForDescription.text = descriptionStringInHeader
        labelForDescription.numberOfLines = 0
        labelForDescription.sizeToFit()
        labelForDescription.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleBottomMargin]

        self.addSubview(labelForDescription)
        
        //initializing layout attributes
        let initialDescriptionLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes()
        initialDescriptionLabelLayoutAttributes.size = labelForDescription.sizeThatFits(labelForDescription.frame.size)
        initialDescriptionLabelLayoutAttributes.center = CGPointMake(self.center.x , labelForDescription.center.y)
        initialDescriptionLabelLayoutAttributes.alpha = 1.0
        addLayoutAttributes(initialDescriptionLabelLayoutAttributes, forSubview: labelForDescription, forProgress: 0.0)
        
        let midwayDescriptionLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: initialDescriptionLabelLayoutAttributes)
        midwayDescriptionLabelLayoutAttributes.center = CGPointMake(self.center.x, (maximumBarHeight - minimumBarHeight) * 0.4 + minimumBarHeight - 55.0)
        midwayDescriptionLabelLayoutAttributes.alpha = 0.5
        addLayoutAttributes(midwayDescriptionLabelLayoutAttributes, forSubview: labelForDescription, forProgress: 0.5)
        
        let finalDescriptionLabelLayoutAttributes = FlexibleHeightBarSubviewLayoutAttributes(layoutAttributes: midwayDescriptionLabelLayoutAttributes)
        finalDescriptionLabelLayoutAttributes.center = CGPointMake(self.center.x, minimumBarHeight - 40.0)
        finalDescriptionLabelLayoutAttributes.alpha = 0.0
        addLayoutAttributes(finalDescriptionLabelLayoutAttributes, forSubview: labelForDescription, forProgress: 1.0)

    }
    
    // MARK: - IBAction -
    @IBAction func pressedCloseButton(sender: AnyObject) {
        closeButtonPressedClosure?()
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        saveButtonPressedClosure?()
    }
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        editButtonPressedClosure?()
    }
    
    
    func getWidthOfLabelWith(font : UIFont , text : String) -> CGFloat{
        
        let label = UILabel(frame: CGRectMake(0.0, 0.0, self.frame.size.width, 10.0))
        label.textAlignment = NSTextAlignment.Left
        label.font = font
        label.text = text
        label.numberOfLines = 0
        label.sizeToFit()

        return label.frame.size.width
    }
}
