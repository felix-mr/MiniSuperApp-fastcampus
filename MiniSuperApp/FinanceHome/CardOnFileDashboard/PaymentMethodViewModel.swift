//
//  PaymentMethodViewModel.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/03.
//

import UIKit

struct PaymentMethodViewModel {
  let name: String
  let digits: String
  let color: UIColor
  
  init(_ paymentMethod: PaymentMethod) {
    name = paymentMethod.name
    digits = "**** \(paymentMethod.digits)"
    color = UIColor(hex: paymentMethod.color) ?? .systemGray2
  }
}
