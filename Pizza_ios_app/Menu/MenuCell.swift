//
//  MenuCell.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/14/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
  
  var view = UIView()
  
  let imageView:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "pizza")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let lableName:UILabel = {
    let lable = UILabel()
    lable.textColor = UIColor.white
    lable.font = UIFont.systemFont(ofSize: 28)
    lable.text = "test"
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  override init(frame: CGRect) {
    super.init(frame:frame)
    
    setupViews()
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var menu:Menu? {
    didSet {
      lableName.text = menu?.name
      imageView.image = UIImage(named: menu!.imageName!)
    }
  }
  
}

extension MenuCell {
  
  func setupViews() {
    
    //MARK view
    view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.red
    view.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    view.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
    
    addSubview(view)
    
    view.addSubview(imageView)
    imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    
    view.addSubview(lableName)
    lableName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    lableName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
  }
  
}

