//
//  SliderCell.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/14/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import ScalingCarousel

class SliderCell: ScalingCarouselCell {
  var view = UIView()
  
  let imageView:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "1")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 8
    return imageView
  }()
  
  lazy var viewPanel:UIView = {
    let panelView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    panelView.translatesAutoresizingMaskIntoConstraints = false
    panelView.backgroundColor = UIColor.white
    panelView.layer.shadowColor = UIColor.black.cgColor
    panelView.layer.shadowOpacity = 0.2
    panelView.layer.shadowOffset = CGSize.zero
    panelView.layer.cornerRadius = 10
    return panelView
  }()
  
  ////MARK: start order button
  var orderButton:UIButton = {
    let button = UIButton(type: .custom)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    button.titleLabel?.numberOfLines = 0
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitle("ORDER\nNOW", for: .normal)
    button.layer.borderColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0).cgColor
    button.layer.borderWidth = 1.0
    button.layer.cornerRadius = 10
    button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    button.backgroundColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0)
    button.titleLabel?.textAlignment = .center
    button.translatesAutoresizingMaskIntoConstraints = false
    //button.addTarget(self, action: #selector(didTapOnSeeAllButton), for: .touchUpInside)
    
    return button
  }()
  
  lazy var lableNameView:UILabel = {
    let label = UILabel()
    label.text = "Saefood Pesto"
    label.numberOfLines = 1
    label.adjustsFontSizeToFitWidth = true
    label.sizeToFit()
    label.textColor = UIColor.black
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()
  
  var startStackView:UIStackView = {
    let stackView = UIStackView(frame: CGRect(x: 0, y:0, width: 50, height: 10))
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis  = .horizontal
    stackView.distribution  = .equalSpacing
    stackView.alignment = .center
    stackView.spacing   = 0
    
    return stackView
  }()
  
  var lableMark:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1.0)
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "4.5"
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  var lableCountReviews:UILabel = {
    let lable = UILabel()
    lable.text = "(378 Reviews)"
    lable.numberOfLines = 0
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    //lable.frame = CGRect(x: 0, y: 0, width: 200, height: 29)
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  var imageDish:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "dish")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
  }()
  
  var lableCategory:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "Pizza"
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  var imageClock:UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "alarm-clock")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
  }()
  
  var lableTimeCook:UILabel = {
    let lable = UILabel()
    lable.numberOfLines = 0
    lable.textColor = UIColor.gray
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.text = "20 mins"
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
  
  func imgStar (x:Int, imageName:String) -> UIImageView {
    let imageStar = UIImageView(frame: CGRect(x: x, y: 0, width: 10, height: 10))
    imageStar.image = UIImage(named: imageName)
    imageStar.contentMode = .scaleAspectFill
    imageStar.clipsToBounds = true
    return imageStar
  }
  
}

extension SliderCell {
  
  func setupViews() {
    mainView = UIView(frame: contentView.bounds)
    contentView.addSubview(mainView)
  
    mainView.addSubview(imageView)
    imageView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: mainView.heightAnchor).isActive = true
    imageView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
    imageView.rightAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    
    imageView.addSubview(viewPanel)
    viewPanel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
    viewPanel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 10).isActive = true
    viewPanel.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -10).isActive = true
    viewPanel.widthAnchor.constraint(equalToConstant: mainView.bounds.size.width - 20).isActive = true
    viewPanel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    print("size = ", mainView.bounds.size.height / 3.7)
    
    viewPanel.addSubview(orderButton)
    orderButton.rightAnchor.constraint(equalTo: viewPanel.rightAnchor, constant: 0).isActive = true
    orderButton.topAnchor.constraint(equalTo: viewPanel.topAnchor, constant: 0).isActive = true
    orderButton.bottomAnchor.constraint(equalTo: viewPanel.bottomAnchor, constant: 0).isActive = true
    orderButton.widthAnchor.constraint(equalToConstant: mainView.bounds.size.width / 3.5).isActive = true

    viewPanel.addSubview(lableNameView)
    lableNameView.topAnchor.constraint(equalTo: viewPanel.topAnchor, constant: 5).isActive = true
    lableNameView.leftAnchor.constraint(equalTo: viewPanel.leftAnchor, constant: 10).isActive = true
    lableNameView.widthAnchor.constraint(equalToConstant: mainView.bounds.size.width / 2).isActive = true
    
    viewPanel.addSubview(startStackView)
    
    var imgArray = [UIImageView]()
    var x = 0
    var img:UIImageView;
    for i in 0...4 {
      x += 10
    
      if i == 4 {
        img = imgStar(x: x, imageName: "star grey")
      } else {
        img = imgStar(x: x, imageName: "star yellow")
      }
      imgArray.append(img)
      startStackView.addSubview(imgArray[i])
    }
    
    startStackView.leftAnchor.constraint(equalTo: viewPanel.leftAnchor, constant: 0).isActive = true
    startStackView.topAnchor.constraint(equalTo: lableNameView.bottomAnchor, constant: 5).isActive = true
    
    
    viewPanel.addSubview(lableMark)
    lableMark.leftAnchor.constraint(equalTo: startStackView.rightAnchor, constant: startStackView.frame.width + 20).isActive = true
    lableMark.topAnchor.constraint(equalTo: startStackView.bottomAnchor).isActive = true
    
    viewPanel.addSubview(lableCountReviews)
    lableCountReviews.leftAnchor.constraint(equalTo: lableMark.rightAnchor, constant: 5).isActive = true
    lableCountReviews.topAnchor.constraint(equalTo: startStackView.bottomAnchor).isActive = true
    
    viewPanel.addSubview(imageDish)
    imageDish.topAnchor.constraint(equalTo: startStackView.bottomAnchor, constant: 20).isActive = true
    imageDish.leftAnchor.constraint(equalTo: viewPanel.leftAnchor, constant: 10).isActive = true
  
    viewPanel.addSubview(lableCategory)
    lableCategory.topAnchor.constraint(equalTo: startStackView.bottomAnchor, constant: 20).isActive = true
    lableCategory.leftAnchor.constraint(equalTo: imageDish.rightAnchor, constant: 10).isActive = true
    
    viewPanel.addSubview(imageClock)
    imageClock.topAnchor.constraint(equalTo: startStackView.bottomAnchor, constant: 20).isActive = true
    imageClock.leftAnchor.constraint(equalTo: lableCategory.rightAnchor, constant: 15).isActive = true
    
    viewPanel.addSubview(lableTimeCook)
    lableTimeCook.topAnchor.constraint(equalTo: startStackView.bottomAnchor, constant: 20).isActive = true
    lableTimeCook.leftAnchor.constraint(equalTo: imageClock.rightAnchor, constant: 10).isActive = true

  }
  
}
