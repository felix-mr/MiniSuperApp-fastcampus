//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/03.
//

import Foundation

struct PaymentMethod: Decodable {
  let id: String
  let name: String
  let digits: String
  let color: String
  let isPrimary: Bool
}
