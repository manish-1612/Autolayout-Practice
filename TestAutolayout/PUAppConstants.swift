//
//  AppConstants.swift
//  PinUp
//
//  Created by Manish Kumar on 31/10/15.
//  Copyright © 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Foundation

class AppConstants {
    
    // ----------------------------------------------------------------
    //   image resolution setting
    // ----------------------------------------------------------------
    static let kProfilePicImageCompressionQualityHigh = 1.0
    static let kProfilePicImageCompressionQualityMiddle = 0.5
    static let kProfilePicImageCompressionQualityLow = 0.1
    static let kImageMaxSizeInBytes = (0.03 * 1024 * 1024)

    
    
    // ----------------------------------------------------------------
    //   segue strings
    // ----------------------------------------------------------------
    static let SegueStringFromLoginToCreateProfile = "LoginCreateProfileSegue"
    static let SegueStringForProfileListVC = "ProfileListSegue"
    static let SegueStringForSignUpVC = "SignUpSegue"
    static let SegueStringForProfileDashboardVC = "SegueToProfileDashBoardVC"
    static let SegueStringForMyInfoVC = "segueToMyInfoVC"
    static let SegueStringForExperienceVC = "segueToExperienceVC"
    static let SegueStringForPieChartVC = "PiechartSegue"
    static let SegueStringForSignUpProfileVC = "SignUpProfileSegue"
    static let SegueStringForLoginProfileListVC = "LoginProfileListSegue"
    
    
    // ----------------------------------------------------------------
    //   font strings
    // ----------------------------------------------------------------
    static let RobotoLightFont = "Roboto-Light"
    static let RobotoRegularFont = "Roboto-Regular"
    static let RobotoMediumFont = "Roboto-Medium"

    
    // ----------------------------------------------------------------
    //   storyborad identifier
    // ----------------------------------------------------------------
    static let CreateProfileVCIdentifier = "CreateProfileVC"
    static let PieChartVCIdentifier = "PieChartVC"
    static let ProfileListVCIdentifier = "ProfileListVC"
    
    // ----------------------------------------------------------------
    //   Notification name identifier
    // ----------------------------------------------------------------
    static let NotificationForExperienceChange = "NotificationForExperienceChange"
    static let NotificationToRemoveInputExperienceField = "NotificationToDeleteInputField"
    static let NotificationForEmptyExperienceField = "NotificationForEmptyExperienceField"
    static let NotificationForNonEmptyExperienceField = "NotificationForNonEmptyExperienceField"
    static let NotificationForTagChangeInTextField = "NotificationForTagChangeInTextField"
    static let NotificationForNewProfile = "NotificationForNewProfile"
    static let NotificationForConfirmationOnChangeInExperienceType = "NotificationForConfirmationOnChangeInExperienceType"

    
    // ----------------------------------------------------------------
    //   parse API keys
    // ----------------------------------------------------------------
    static let ParseApplicationKey = "PkVC0BvRy98NoSYM3yMNUWzWaxZzphtfxuz8dugz"
    static let ParseRestAPIKey = "PInVLdWZ7P0CcXuNICkPsUbZ3PQ3yR3wnvSIbLQJ"

    
    
    // ----------------------------------------------------------------
    //   linked IN API keys
    // ----------------------------------------------------------------
    static let LinkedInClientId = "7578dn3cd7cpph"
    static let LinkedInClientSecret = "6Rl8JPhYhb5j3V3d"
    
    // ----------------------------------------------------------------
    //   Regex for Field validation
    // ----------------------------------------------------------------
    static let RegexForEmptyChecking     = "(\\s*[\\S]+\\s*)+"
    static let RegexForInchRangeChecking = "^((1[0-1])|(0?[0-9]))$"
    static let RegexForNumberChecking    = "[\\d+|\\+|\\-|\\(|\\)]*"
    static let RegexForEmailChecking = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        static let RegexForNameChecking      = "^[a-zA-Z ]{1,30}$"
    static let RegexPasswordLimit = "^.{6,20}$"
    static let RegexForUrl = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
    static let RegexForProjectExperience = "([a-zA-Z0-9.\\s])+,\\s\\d+"
    static let RegexForYearExperience = "([a-zA-Z0-9.\\s])+,\\s\\d+,\\s\\d[0|1|2]*"
    static let RegexForAvailableFromDate = "^([0][1-9]|[1|2][0-9]|[3][0|1])\\/([0][1-9]|[1][0-2])\\/(\\d{4})$"
    static let RegexForAvailableInLength = "\\w{1,50}$"

}



