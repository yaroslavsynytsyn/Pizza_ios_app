//
//  PizzaViewController.swift
//  Pizza_ios_app
//
//  Created by Yaroslav on 5/14/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import ScalingCarousel

class PizzaViewController: UIViewController {
  
  let cellSliderIdent = "cellSlider"
  let cellTableIdentifier = "cellTable"
  
  var arrayUIImage = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
  
  //model
  var itemMenuArray:[Pizza] = {
    var pizza0 = Pizza()
    pizza0.imageName = "pizza_fresca2"
    pizza0.name = "Tropical Storm"
    pizza0.description = "Cheesy mayo sauce and mozzarella, tomatoes, green pepper, onion"
    pizza0.category = "Pizza"
    pizza0.timeCook = "15 mins"
    pizza0.mark = "5.0"
    
    var pizza1 = Pizza()
    pizza1.imageName = "pizza_fresca3"
    pizza1.name = "Ocean Delight"
    pizza1.description = "Squid, clams, crab stick, pineapple, Cheesy mayo sauce and mozzarella"
    pizza1.category = "Pizza"
    pizza1.timeCook = "20 mins"
    pizza1.mark = "5.0"
    
    var pizza2 = Pizza()
    pizza2.imageName = "pizza_fresca1"
    pizza2.name = "Hawaiian Paradise"
    pizza2.description = "Ham, pineapple, Mozzarella cheese and tomato sauce"
    pizza2.category = "Pizza"
    pizza2.timeCook = "25 mins"
    pizza2.mark = "5.0"
    
    var pizza3 = Pizza()
    pizza3.imageName = "pizza_fresca0"
    pizza3.name = "Supreme Meat Lover's"
    pizza3.description = "Bacon, beef, ham and pepperoni, Mozzarella cheese and tomato sauce"
    pizza3.category = "Pizza"
    pizza3.timeCook = "15 mins"
    pizza3.mark = "5.0"
    
    return [pizza0, pizza1, pizza2, pizza3]
  }()
  
  lazy var viewWidth =  {
    return view.frame.size.width
  }()
  
  lazy var viewHeight =  {
    return view.frame.size.height
  }()
  
  //MARK header image
  var headerImageView:UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "Rectangle"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
  }()
  
  var menuButton:UIButton = {
    let button = UIButton(type: .roundedRect)
    let menuImage = UIImage(named: "menu")
    button.setBackgroundImage(menuImage, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  var bagButton:UIButton = {
    let button = UIButton(type: .roundedRect)
    let bagImage = UIImage(named: "bag")
    button.setBackgroundImage(bagImage, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  //MARK title
  var titleLable:UILabel = {
    let lable = UILabel()
    lable.text = "PIZZA"
    lable.numberOfLines = 0
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    lable.textColor = UIColor.white
    lable.font = UIFont.systemFont(ofSize: 28)
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  lazy var scalingCarousel:ScalingCarouselView = {
    let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: viewHeight / 2.5)
    let carousel = ScalingCarouselView(withFrame: frame, andInset: 23)
    carousel.translatesAutoresizingMaskIntoConstraints = false
    carousel.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0)
    carousel.isPagingEnabled = true
    carousel.showsHorizontalScrollIndicator = false
    carousel.dataSource = self
    carousel.delegate = self
    
    return carousel
  }()
  
  lazy var pageCarousel:UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.numberOfPages = arrayUIImage.count
    pageControl.currentPage = 1
    pageControl.tintColor = UIColor.white
    pageControl.pageIndicatorTintColor = UIColor.black
    pageControl.currentPageIndicatorTintColor = .red
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    
    return pageControl
  }()
  
  
  lazy var line:UIView = {
    let lineView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1.0))
    lineView.layer.borderWidth = 1.0
    lineView.layer.borderColor = UIColor.init(red: 228/255, green: 228/255, blue: 228/255, alpha: 1.0).cgColor
    lineView.translatesAutoresizingMaskIntoConstraints = false
    
    return lineView
  }()
  
  var popularLable:UILabel = {
    let lable = UILabel()
    lable.text = "Popular  ∙"
    lable.font = UIFont.systemFont(ofSize: 20)
    lable.numberOfLines = 0
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    lable.textColor = UIColor.black
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  var countDish:UILabel = {
    let lable = UILabel()
    lable.text = "18 Dishes"
    lable.font = UIFont.systemFont(ofSize: 15)
    lable.numberOfLines = 0
    lable.adjustsFontSizeToFitWidth = true
    lable.sizeToFit()
    lable.textColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
    lable.translatesAutoresizingMaskIntoConstraints = false
    
    return lable
  }()
  
  var buttonSeeAll:UIButton = {
    let button = UIButton(type: .custom)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button.setTitleColor(UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0), for: .normal)
    button.setTitle(" See All   ", for: .normal)
    button.titleLabel?.textAlignment = .center
    button.setImage(UIImage(named: "arrow red"), for: .normal)
    button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 85, bottom: 0,right: -5)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  let createOwnPizza:UIButton = {
    let button = UIButton(type: .custom)
    let startButtonWidth = 35
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitle("    CREATE YOUR OWN    ", for: .normal)
    button.layer.borderColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0).cgColor
    button.layer.borderWidth = 1.0
    button.layer.cornerRadius = CGFloat(startButtonWidth) / 2
    button.backgroundColor = UIColor(red: 229/255, green: 41/255, blue: 62/255, alpha: 1.0)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var collectionViewTable:UICollectionView = {
    //MARK layout for collectionView
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    
    //MARK collectionView
    //let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 300), collectionViewLayout: layout)
    let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width: 0, height: 0), collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    scalingCarousel.register(SliderCell.self, forCellWithReuseIdentifier: cellSliderIdent)
    collectionViewTable.register(PizzaCell.self, forCellWithReuseIdentifier: cellTableIdentifier)
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

extension PizzaViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if collectionView == self.scalingCarousel {
      return arrayUIImage.count
    } else {
      return itemMenuArray.count
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if collectionView == self.scalingCarousel {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSliderIdent, for: indexPath)
      
      if let scalingCell = cell as? SliderCell {
        scalingCell.imageView.image = arrayUIImage[indexPath.row]
      }
      DispatchQueue.main.async {
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
      }
      
      return cell
    } else {
      if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTableIdentifier, for: indexPath) as? PizzaCell {
        itemCell.pizza = itemMenuArray[indexPath.row]
        
        return itemCell
      }
      
      return UICollectionViewCell()
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    if collectionView == self.scalingCarousel {
      return CGSize(width: view.frame.size.width-46, height: view.bounds.size.height/2.5)
    } else {
      return CGSize(width: view.frame.size.width, height: 100)
    }
    
    
  }
  
  
  
  
}

extension PizzaViewController {
  func setupView() {
    view.backgroundColor = UIColor.white
    
    view.addSubview(headerImageView)
    
    headerImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    headerImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    headerImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    headerImageView.heightAnchor.constraint(equalToConstant: viewHeight / 3).isActive = true
    
    view.addSubview(menuButton)
    menuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
    menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    
    view.addSubview(bagButton)
    bagButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
    bagButton.topAnchor.constraint(equalTo: menuButton.topAnchor).isActive = true
    
    view.addSubview(titleLable)
    titleLable.topAnchor.constraint(equalTo: bagButton.topAnchor).isActive = true
    titleLable.leftAnchor.constraint(equalTo: menuButton.rightAnchor, constant: viewWidth / 2 - 80).isActive = true
    
    view.addSubview(scalingCarousel)
    scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    scalingCarousel.heightAnchor.constraint(equalToConstant: view.bounds.size.height/2.5).isActive = true
    scalingCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    scalingCarousel.topAnchor.constraint(equalTo: bagButton.bottomAnchor, constant: 10).isActive = true
    
    view.addSubview(pageCarousel)
    pageCarousel.topAnchor.constraint(equalTo: scalingCarousel.bottomAnchor).isActive = true
    pageCarousel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.bounds.size.width/2-30).isActive = true
    pageCarousel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    view.addSubview(line)
    line.topAnchor.constraint(equalTo: pageCarousel.bottomAnchor, constant: 5).isActive = true
    line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    line.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    line.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    
    view.addSubview(popularLable)
    popularLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    popularLable.topAnchor.constraint(equalTo: line.topAnchor, constant: 5).isActive = true
    
    view.addSubview(countDish)
    countDish.leftAnchor.constraint(equalTo: popularLable.rightAnchor, constant: 15).isActive = true
    countDish.topAnchor.constraint(equalTo: line.topAnchor, constant: 10).isActive = true
    
    view.addSubview(buttonSeeAll)
    buttonSeeAll.topAnchor.constraint(equalTo: line.topAnchor, constant: 5).isActive = true
    buttonSeeAll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    
    view.addSubview(collectionViewTable)
    collectionViewTable.topAnchor.constraint(equalTo: popularLable.bottomAnchor, constant: 10).isActive = true
    collectionViewTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    collectionViewTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    collectionViewTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    
    view.addSubview(createOwnPizza)
    createOwnPizza.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    createOwnPizza.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (viewWidth-createOwnPizza.intrinsicContentSize.width) / 2).isActive = true
    
    print("cre = ", createOwnPizza.intrinsicContentSize.width - 167)
    
    
  }
}
