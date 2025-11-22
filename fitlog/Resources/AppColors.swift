//
//  AppColors.swift
//  fitlog
//
//  Created by 12345 on 22/11/2025.
//

import Foundation
import SwiftUI

class AppThemes{
    static let primaryClr = Color("PrimaryBackground")
    static let secondaryClr = Color("SecondaryBackground")
    static let accentClr = Color("AccentColor")
    static let textClr = Color("textColor")
    
    
    
    static func bold(_ size: CGFloat) -> Font {
        Font.custom("Ubuntu-Bold", size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        Font.custom("Ubuntu-Medium", size: size)
    }
    
    static func regular(_ size: CGFloat) -> Font {
        Font.custom("Ubuntu-Regular", size: size)
    }
    
}
