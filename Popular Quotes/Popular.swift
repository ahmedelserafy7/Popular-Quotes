//
//  Popular.swift
//  Popular Quotes
//
//  Created by Elser_10 on 3/4/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class Popular: NSObject {
    var quote: String?
    var popularImage: String?
    init(_ quote: String, _ popularImage: String) {
        self.quote = quote
        self.popularImage = popularImage
    }
}
