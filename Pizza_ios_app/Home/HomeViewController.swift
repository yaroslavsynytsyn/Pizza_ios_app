//
//  ViewController.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/13/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  var backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "home")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var restauranLable: UILabel = {
    let lable = UILabel()
    lable.text = "Restaurant"
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    lable.textColor = UIColor.white
    lable.font = UIFont.systemFont(ofSize: 40)
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  var cheezaPizzaLable: UILabel = {
    let lable = UILabel()
    lable.text = "cheeza pizza"
    lable.numberOfLines = 0
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    lable.textColor = UIColor.white
    lable.font = UIFont.systemFont(ofSize: 28)
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  
  var startOrderButton:UIButton = {
    let button = UIButton(type: .custom)
    let startButtonWidth = 35
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitle("START ORDER ", for: .normal)
    button.layer.borderColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0).cgColor
    button.layer.borderWidth = 1.0
    button.layer.cornerRadius = CGFloat(startButtonWidth) / 2
    button.backgroundColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0)
    button.setImage(UIImage(named: "arrow"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(didTapOnSeeAllButton), for: .touchUpInside)
    return button
  }()
  
  //MARK tap on button start order
  @objc func didTapOnSeeAllButton() {
    // create MenuViewController object and
    let menuVC = MenuViewController()
    
    // switch to MenuViewController
    self.navigationController?.pushViewController(menuVC, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  // disable navigationbar in HomeViewController
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController!.navigationBar.shadowImage = UIImage()
    navigationController!.navigationBar.isTranslucent = true
  }

}

extension HomeViewController {
  
  //setup all ui control on view
  func setupView() {
    
    // added backgroundImageView
    view.addSubview(backgroundImageView)
    
    // position backgroundImageView on view
    backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    
    // added lable restauran on view
    view.addSubview(restauranLable)
    
    // position restauranLable on view
    restauranLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    restauranLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
    
    //added lable cheezaPizzaLable on view
    view.addSubview(cheezaPizzaLable)
    
    //position cheezaPizzaLable on view
    cheezaPizzaLable.leftAnchor.constraint(equalTo: restauranLable.leftAnchor).isActive = true
    cheezaPizzaLable.topAnchor.constraint(equalTo: restauranLable.bottomAnchor).isActive = true
    
    view.addSubview(startOrderButton)
    
    startOrderButton.leftAnchor.constraint(equalTo: cheezaPizzaLable.leftAnchor).isActive = true
    startOrderButton.topAnchor.constraint(equalTo: cheezaPizzaLable.bottomAnchor, constant: 5).isActive = true
    startOrderButton.widthAnchor.constraint(equalToConstant: cheezaPizzaLable.intrinsicContentSize.width).isActive = true
    startOrderButton.heightAnchor.constraint(equalToConstant: cheezaPizzaLable.intrinsicContentSize.height).isActive = true
  
    let imageWidth = startOrderButton.imageView!.frame.width
    let buttonWidth = startOrderButton.frame.width
    
    //image in button move to the left
    startOrderButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth - imageWidth - 5, bottom: 0, right: 0)

  }
}

