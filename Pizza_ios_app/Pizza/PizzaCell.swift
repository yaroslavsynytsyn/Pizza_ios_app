//
//  PizzaCell.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/15/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class PizzaCell: UICollectionViewCell {
  
  var view = UIView()

  let imageView:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "pizza_fresca0")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let lableName:UILabel = {
    let lable = UILabel()
    lable.textColor = UIColor.black
    lable.font = UIFont.systemFont(ofSize: 14)
    lable.text = "Tropical Storm"
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  let lableDescription:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "Cheesy mayo sauce and mozzarella, tomatoes, green pepper, onion"
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  let imageDish:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "dish")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let lableCategory:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "Pizza"
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  let lableTimeCock:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "15 mins"
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  let imageClock:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "alarm-clock")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let imageStar:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "star yellow")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let lableStar:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1.0)
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "5.0"
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
  
  var pizza:Pizza? {
    didSet {
      lableName.text = pizza?.name
      imageView.image = UIImage(named: pizza!.imageName!)
      lableStar.text = pizza?.mark
      lableCategory.text = pizza?.category
      lableDescription.text = pizza?.description
      lableTimeCock.text = pizza?.timeCook
    }
  }
  
}

extension PizzaCell {
  
  func setupViews() {
    
    view = UIView(frame: CGRect(x:10, y:20, width: frame.width-20, height: frame.height))
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.white
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.2
    view.layer.shadowOffset = CGSize.zero
    view.layer.cornerRadius = 10
    
    contentView.addSubview(view)
    
    view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
    
    view.addSubview(imageView)
    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    
    view.addSubview(lableName)
    lableName.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    lableName.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5).isActive = true
    
    
    view.addSubview(lableStar)
    lableStar.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
    lableStar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    
    view.addSubview(imageStar)
    imageStar.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    imageStar.rightAnchor.constraint(equalTo: lableStar.leftAnchor, constant: -5).isActive = true
    
    view.addSubview(lableDescription)
    lableDescription.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5).isActive = true
    lableDescription.topAnchor.constraint(equalTo: lableName.bottomAnchor, constant: 5).isActive = true
    lableDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    
    view.addSubview(imageDish)
    imageDish.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5).isActive = true
    imageDish.topAnchor.constraint(equalTo: lableDescription.bottomAnchor, constant: 5).isActive = true
    
    view.addSubview(lableCategory)
    lableCategory.leftAnchor.constraint(equalTo: imageDish.rightAnchor, constant: 10).isActive = true
    lableCategory.topAnchor.constraint(equalTo: lableDescription.bottomAnchor, constant: 5).isActive = true
    
    view.addSubview(imageClock)
    imageClock.leftAnchor.constraint(equalTo: lableCategory.rightAnchor, constant: 20).isActive = true
    imageClock.topAnchor.constraint(equalTo: lableDescription.bottomAnchor, constant: 5).isActive = true
    
    view.addSubview(lableTimeCock)
    lableTimeCock.leftAnchor.constraint(equalTo: imageClock.rightAnchor, constant: 10).isActive = true
    lableTimeCock.topAnchor.constraint(equalTo: lableDescription.bottomAnchor, constant: 5).isActive = true
    
    
  }
  
}

struct Pizza {
  var name:String?
  var imageName:String?
  var mark:String?
  var description:String?
  var category:String?
  var timeCook:String?
}
