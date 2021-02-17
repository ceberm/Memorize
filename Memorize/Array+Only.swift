//
//  Array+Only.swift
//  Memorize
//
//  Created by Cesar on 16/2/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
