//
//  NumberFormatter.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/01.
//

import Foundation

struct Formatter {
  static let balanceFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    
    return formatter
  }()
}
