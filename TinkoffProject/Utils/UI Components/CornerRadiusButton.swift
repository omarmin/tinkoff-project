//
//  CornerRadiusButton.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

class CornerRadiusButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }
  
  private func sharedInit() {
    let cornerRadius = frame.height/2
    layer.cornerRadius = cornerRadius
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    sharedInit()
  }
}
