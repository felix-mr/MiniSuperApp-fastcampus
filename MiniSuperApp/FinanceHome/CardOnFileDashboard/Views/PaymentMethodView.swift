//
//  PaymentMethodView.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/02.
//

import UIKit

final class PaymentMethodView: UIView {
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 18, weight: .semibold)
    label.textColor = . white
    label.text = "신한은행"
    
    return label
  }()
  
  private let subTitleLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 15, weight: .regular)
    label.textColor = .white
    label.text = "110 391 911297"
    
    return label
  }()
  
  init(viewModel: PaymentMethodViewModel) {
    super.init(frame: .zero)
    
    nameLabel.text = viewModel.name
    subTitleLabel.text = viewModel.digits
    backgroundColor = viewModel.color
    
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupViews()
  }
  
  private func setupViews() {
    addSubview(nameLabel)
    addSubview(subTitleLabel)
    
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
      subTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor )
    ])
  }
}
