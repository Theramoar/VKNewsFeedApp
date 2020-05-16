//
//  String + Height.swift
//  VKNewsFeed
//
//  Created by Mihails Kuznecovs on 20/07/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import UIKit


extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        
        return ceil(size.height)
    }
}
