//
//  MenuViewController.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/14/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController  {
  
  let cellReuseIdentifier = "menuCell"
  
  lazy var viewWidth =  {
    return view.frame.size.width
  }()
  
  lazy var viewHeight =  {
    return view.frame.size.height
  }()

  
  lazy var collectionView:UICollectionView = {
    //MARK layout for collectionView
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    
    //MARK collectionView
    var collectionV = UICollectionView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight/2), collectionViewLayout: layout)
    
    collectionV.backgroundColor = UIColor.white
    collectionV.translatesAutoresizingMaskIntoConstraints = false
    collectionV.showsVerticalScrollIndicator = false
    collectionV.isPagingEnabled = true
    collectionV.dataSource = self
    collectionV.delegate = self
    
    return collectionV
  }()
  
  //MARK: menuButton
  let menuButton:UIButton = {
    let button = UIButton(type: .roundedRect)
    let menuImage = UIImage(named: "menu")
    button.setBackgroundImage(menuImage, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  //MARK: bagButton
  let bagButton:UIButton =  {
    let button = UIButton(type: .roundedRect)
    let bagImage = UIImage(named: "bag")
    button.setBackgroundImage(bagImage, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  //model
  var itemMenuArray:[Menu] = {
    var blankMenu0 = Menu()
    blankMenu0.imageName = "pizza"
    blankMenu0.name = "Pizza"
    
    var blankMenu1 = Menu()
    blankMenu1.imageName = "pasta"
    blankMenu1.name = "Pasta"
    
    var blankMenu2 = Menu()
    blankMenu2.imageName = "salad"
    blankMenu2.name = "Salad"
    
    var blankMenu3 = Menu()
    blankMenu3.imageName = "dessert"
    blankMenu3.name = "Dessert"
    
    var blankMenu4 = Menu()
    blankMenu4.imageName = "beverage"
    blankMenu4.name = "Beverage"
    
    return [blankMenu0, blankMenu1, blankMenu2, blankMenu3, blankMenu4]
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
  }
  
  // disable navigationbar in MenuViewController
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  
}

extension MenuViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemMenuArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? MenuCell {
      
      itemCell.menu = itemMenuArray[indexPath.row]
      
      return itemCell
    }
    return UICollectionViewCell()
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
    
    //let pizzaViewController = PizzaViewController()
    //present(pizzaViewController, animated: true, completion: nil)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    return CGSize(width: viewWidth, height: viewHeight/3)
  }
  
}

extension MenuViewController {
  
  func setupView() {
  
    view.addSubview(collectionView)
    
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    
    view.addSubview(menuButton)
    menuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
    menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    
    view.addSubview(bagButton)
    bagButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
    bagButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
  }
  
}
