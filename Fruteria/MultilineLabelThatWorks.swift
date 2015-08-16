//
//  MultilineLabelThatWorks.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class MultilineLabelThatWorks : UILabel {
  override func layoutSubviews() {
    super.layoutSubviews()
    preferredMaxLayoutWidth = bounds.width
    super.layoutSubviews()
  }
  
  override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    var rect = layoutMargins.apply(bounds)
    rect = super.textRectForBounds(rect, limitedToNumberOfLines: numberOfLines)
    return layoutMargins.inverse.apply(rect)
  }
  
  override func drawTextInRect(rect: CGRect) {
    super.drawTextInRect(layoutMargins.apply(rect))
  }
}

extension UIEdgeInsets {
  var inverse : UIEdgeInsets {
    return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }
  func apply(rect: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(rect, self)
  }
}

