//
//  MyAnimation.swift
//  Task5
//
//  Created by Лада on 22/10/2019.
//  Copyright © 2019 Лада. All rights reserved.
//

import Foundation
import UIKit

class MySuperPuperAnimation: UIViewController {
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    let viewController : ViewController = {
        let viewController = ViewController()
        return viewController
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .custom)
        let height: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = UIScreen.main.bounds.width
        let x = width / 10.0 * 2.0
        let y = height / 10.0 * 8.0
        let myHeight = height / 10.0
        let myWidth = width / 5.0 * 3.0
        
        
        button.setTitle("Анимация", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
        button.frame = CGRect(x: x, y: y, width: myWidth, height: myHeight)
        
        return button
    }()
    
    let myForest: UIImageView = {
        let height: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = UIScreen.main.bounds.width
        
        let firstX: CGFloat = width / 10.0
        let firstY: CGFloat = height / 10.0
        
        let deltaX: CGFloat = width / 10.0
        let deltaY: CGFloat = height / 5.0
        
        let floor = UIImageView()
        floor.backgroundColor = UIColor.green
        floor.frame = CGRect(x: 0.0, y: firstY + 0.5 * deltaY, width: width, height: height - (firstY + 0.5 * deltaY))
        
        let treeOne = UIImageView(image: UIImage(named: "TreeOne"))
        treeOne.frame = CGRect(x: firstX, y: -0.5 * firstY, width: firstX * 4.0, height: firstY * 3.0)
        floor.addSubview(treeOne)
        
        let treeTwo = UIImageView(image: UIImage(named: "TreeTwo"))
        treeTwo.frame = CGRect(x: firstX + deltaX, y: 0.5 * firstY + 0.5 * deltaY, width: firstX * 4.0, height: firstY * 3.0)
        floor.addSubview(treeTwo)

        let treeThree = UIImageView(image: UIImage(named: "TreeThree"))
        treeThree.frame = CGRect(x: firstX + 6.0 * deltaX, y: firstY + 2.0 * deltaY, width: firstX * 4.0, height: firstY * 3.0)
        floor.addSubview(treeThree)

        let treeFour = UIImageView(image: UIImage(named: "TreeThree"))
        treeFour.frame = CGRect(x: firstX + 5.0 * deltaX, y: -1.5 * firstY, width: firstX * 4.0, height: firstY * 3.0)
        floor.addSubview(treeFour)
        
        let treeFive = UIImageView(image: UIImage(named: "TreeTwo"))
        treeFive.frame = CGRect(x: firstX + 0.5 * deltaX, y:firstY + 2.0 * deltaY, width: firstX * 2.0, height: firstY * 2.0)
        floor.addSubview(treeFive)
        
        return floor
    }()
    
    let mySun: UIImageView = {
        let height: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = UIScreen.main.bounds.width
        
        let firstX: CGFloat = width / 10.0
        let firstY: CGFloat = height / 10.0
        
        let deltaX: CGFloat = width / 10.0
        let deltaY: CGFloat = height / 5.0
        
        let sun = UIImageView(image: UIImage(named: "sun"))
        sun.frame = CGRect(x: firstX, y: 0.5 * firstY , width: 1.75 * firstX, height: firstY)
        return sun
    }()

    let myManStay: UIImageView = {
        let height: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = UIScreen.main.bounds.width
        
        let firstX: CGFloat = width / 10.0
        let firstY: CGFloat = height / 10.0
        
        let myMan = UIImageView(image: UIImage(named: "ManStay"))
        myMan.frame = CGRect(x: 5.0 * firstX, y: 5.0 * firstY, width: 2.75 * firstX , height: 1.75 * firstY)
        
        return myMan
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.cyan
        view.addSubview(button)
    }
    
    @objc func tapButton() {
        view.addSubview(myForest)
        view.addSubview(myManStay)
        view.addSubview(mySun)
        
        let height: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = UIScreen.main.bounds.width
        
        let firstX: CGFloat = mySun.frame.midX
        let firstY: CGFloat = mySun.frame.midY
        
        let theAnimationMove = CAKeyframeAnimation(keyPath: "position")
        let pathArray = [[firstX, firstY],
                         [1.5 * firstX, 0.8 * firstY],
                         [2.0 * firstX, 0.6 * firstY],
                         [2.5 * firstX, 0.8 * firstY],
                         [3.0 * firstX, firstY],
                         [3.0 * firstX, firstY],
                         [2.5 * firstX, 0.8 * firstY],
                         [2.0 * firstX, 0.6 * firstY],
                         [1.5 * firstX, 0.8 * firstY],
                         [ firstX, firstY]]
        theAnimationMove.values = pathArray
        theAnimationMove.duration = 1.0
        theAnimationMove.repeatCount = 3.0
        theAnimationMove.beginTime = 0.0
        
        let theAnimation = CABasicAnimation(keyPath: "position")
        theAnimation.fromValue = [firstX, firstY]
        theAnimation.toValue = [0.5 * width, 0.5 * height]
        theAnimation.duration = 2.0
        theAnimation.beginTime = theAnimationMove.duration * Double(theAnimationMove.repeatCount)
        theAnimation.isRemovedOnCompletion = false
        theAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        let theAnimationScale = CABasicAnimation(keyPath: "transform.scale")
        theAnimationScale.fromValue = 1.0
        theAnimationScale.toValue = 3.0
        theAnimationScale.duration = 0.75
        theAnimationScale.beginTime = theAnimation.beginTime + theAnimation.duration
        theAnimationScale.repeatCount = 3.0
        
        let animationGroupFirst = CAAnimationGroup()
        animationGroupFirst.animations = [theAnimationMove,theAnimation,theAnimationScale]
        animationGroupFirst.duration = theAnimationScale.beginTime + theAnimationScale.duration * Double(theAnimationScale.repeatCount)
        animationGroupFirst.isRemovedOnCompletion = false
        animationGroupFirst.fillMode = CAMediaTimingFillMode.forwards
        animationGroupFirst.repeatCount = 3.0
        
        mySun.layer.add(animationGroupFirst, forKey: "move")
    }
}
