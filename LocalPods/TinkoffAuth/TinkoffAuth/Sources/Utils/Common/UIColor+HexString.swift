//
//  UIColor+HexString.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

extension UIColor {
  public convenience init?(hex: String) {
    let rComponent, gComponent, bComponent, aComponent: CGFloat
    
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      
      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          rComponent = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          gComponent = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          bComponent = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          aComponent = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: rComponent, green: gComponent, blue: bComponent, alpha: aComponent)
          return
        }
      }
    }
    
    return nil
  }
}
