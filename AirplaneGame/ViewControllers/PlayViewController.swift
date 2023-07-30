//
//  ViewController.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 15.06.2023.
//

import UIKit

class PlayViewController: UIViewController {
    
    let backView = UIView()
    let leftSide = UIView()
    let rightSide = UIView()
    let colorOfSides = UIColor()
    let leftButton = UIButton()
    let rightButton = UIButton()
    let airplane = UIImage(named: "plane.jpg")
    let planeView: UIImageView = UIImageView()
    let sizeOfSides = CGFloat(80)
    let imageViewSize = CGFloat(70)
    let buttonWidth = CGFloat(117)
    let buttonHeight = CGFloat(70)
    let planeSize = CGFloat(70)
    let stepOfPlaneMoving = CGFloat(10)
    let ufoSize = CGFloat(100)
    let stepOfUfoMoving = CGFloat(3)
    let const = CGFloat(110)
    let areaBetweenButtons = CGFloat(20)
    let areaModal = CGFloat(80)
    let timerModel = TimerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSides()
        addButtons()
        addAirplane()
        playTreeAnimation()
        playUfoAnimation()
        timerModel.startGameTimer()
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.movingWithSwipe(sender:)))
        leftSwipeRecognizer.direction = .left
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.movingWithSwipe(sender:)))
        rightSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(leftSwipeRecognizer)
        self.view.addGestureRecognizer(rightSwipeRecognizer)
    }
    
    @objc func movingWithSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            planeView.frame.origin.x -= stepOfPlaneMoving
        }
        if sender.direction == .right {
            planeView.frame.origin.x += stepOfPlaneMoving
        }
    }
    
    // MARK: - Sides
    func addSides() {
        leftSide.frame = CGRect(x: self.view.frame.minX,
                                y: self.view.frame.minY,
                                width: sizeOfSides,
                                height: self.view.frame.minY + self.view.frame.maxY
        )
        leftSide.backgroundColor = .systemGreen
        self.view.addSubview(leftSide)
        
        rightSide.frame = CGRect(x: self.view.frame.maxX - sizeOfSides,
                                 y: self.view.frame.minY,
                                 width: sizeOfSides,
                                 height: self.view.frame.minY + self.view.frame.maxY
        )
        rightSide.backgroundColor = .systemGreen
        self.view.addSubview(rightSide)
        
        backView.frame = CGRect(x: Int(self.view.frame.minX + sizeOfSides),
                                y: Int(self.view.frame.minY),
                                width: Int(self.view.frame.maxX - 2 * sizeOfSides),
                                height: Int(self.view.frame.minY + self.view.frame.maxY)
        )
        backView.backgroundColor = .systemGray2
        self.view.addSubview(backView)
    }
    
    func playTreeAnimation() {
        let updateInterval = 0.5
        Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { timer in
            let newTreeLeft = self.addTrees(xCoordinate: Int(self.view.frame.minX) )
            let newTreeRight = self.addTrees(xCoordinate: Int(self.view.frame.maxX - newTreeLeft.frame.width))
            UIView.animate(withDuration: 3, delay: 0, options: [.curveLinear]) {
                newTreeLeft.frame.origin.y += self.view.frame.maxY
                newTreeRight.frame.origin.y += self.view.frame.maxY
            } completion: { [] Bool in
                newTreeLeft.removeFromSuperview()
                newTreeRight.removeFromSuperview()
            }
        }
    }
    
    func addTrees(xCoordinate: Int) -> UIImageView {
        let tree = UIImage(named: "treevector.png")
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.frame.size.width = imageViewSize
        imageView.frame.size.height = imageViewSize
        imageView.backgroundColor = .clear
        imageView.isOpaque = false
        imageView.image = tree
        imageView.frame.origin.x = CGFloat(xCoordinate)
        
        self.view.addSubview(imageView)
        return imageView
    }
    
    // MARK: - Buttons
    
    func addButtons() {
        leftButton.frame = CGRect(x: self.view.frame.midX - buttonWidth + areaBetweenButtons,
                                  y: self.view.frame.maxY - buttonHeight - areaModal,
                                  width: buttonWidth,
                                  height: buttonHeight
        )
        leftButton.backgroundColor = .darkGray
        leftButton.setTitle("Left", for: .normal)
        leftButton.addTarget(self, action: Selector(("pressed")), for: .touchUpInside)
        leftButton.layer.cornerRadius = 7
        
        let tapOnTheLeftButton = UITapGestureRecognizer(target: self, action: #selector(self.buttonLeftPressed(sender:)))
        
        rightButton.frame = CGRect(x: self.view.frame.midX - areaBetweenButtons,
                                   y: self.view.frame.maxY - buttonHeight - areaModal,
                                   width: buttonWidth,
                                   height: buttonHeight
        )
        rightButton.backgroundColor = .darkGray
        rightButton.setTitle("Right", for: .normal)
        rightButton.addTarget(self, action: Selector(("pressed")), for: .touchUpInside)
        rightButton.layer.cornerRadius = 7
        
        let tapOnTheRightButton = UITapGestureRecognizer(target: self, action: #selector(self.buttonRightPressed(sender:)))
        
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
        self.leftButton.addGestureRecognizer(tapOnTheLeftButton)
        self.rightButton.addGestureRecognizer(tapOnTheRightButton)
    }
    
    @objc func buttonLeftPressed(sender: UITapGestureRecognizer) {
        if planeView.frame.origin.x >= self.view.frame.minX + self.sizeOfSides {
            planeView.frame.origin.x -= stepOfPlaneMoving
        } else {
            crash()
        }
    }
    
    @objc func buttonRightPressed(sender: UITapGestureRecognizer) {
        if planeView.frame.origin.x <= self.view.frame.maxX - self.sizeOfSides - self.planeSize {
            planeView.frame.origin.x += stepOfPlaneMoving
        } else {
            crash()
        }
    }
    
    // MARK: - Airplane
    
    func addAirplane() {
        planeView.contentMode = UIView.ContentMode.scaleAspectFit
        planeView.frame.size.width = planeSize
        planeView.frame.size.height = planeSize
        planeView.frame.origin.x = self.view.frame.midX - planeView.frame.size.width / 2
        planeView.frame.origin.y = self.view.frame.maxY - self.buttonHeight - planeView.frame.size.height - areaModal
        planeView.backgroundColor = .clear
        planeView.image = airplane
        
        self.view.addSubview(planeView)
        
    }
    
    // MARK: - UFO
    
    func playUfoAnimation() {
        let newUfo = self.addUfo(xCoordinate: Int(CGFloat.random(in: self.view.frame.minX + self.sizeOfSides...self.view.frame.maxX - self.sizeOfSides - self.ufoSize)))
        
        let updateInterval = 0.03
        Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { timer in
            
            if self.PlaneAndUfoCrash(ufoCoordinateX: newUfo.frame.origin.x , ufoCoordinateY: newUfo.frame.origin.y) {
                self.crash()
            }
            
            if newUfo.frame.origin.y <= self.view.frame.maxY {
                newUfo.frame.origin.y += self.stepOfUfoMoving
            } else {
                newUfo.frame.origin.y = self.view.frame.minY
                newUfo.frame.origin.x =
                CGFloat.random(in: self.view.frame.minX + self.sizeOfSides...self.view.frame.maxX - self.sizeOfSides - self.ufoSize)
            }
        }
    }
    
    func PlaneAndUfoCrash(ufoCoordinateX: CGFloat, ufoCoordinateY: CGFloat) -> Bool {
        var isCrash: Bool = false
        
        if ufoCoordinateY >= planeView.frame.origin.y && (ufoCoordinateX >= planeView.frame.minX || ufoCoordinateX <= planeView.frame.maxX) {
            isCrash = true
        } else if ufoCoordinateY >= planeView.frame.origin.y && (ufoCoordinateX < planeView.frame.minX || ufoCoordinateX > planeView.frame.maxX) {
            isCrash = false
        }
        return isCrash
    }
    
    func addUfo(xCoordinate: Int) -> UIImageView {
        let ufo = UIImage(named: "ufo.png")
        let ufoView: UIImageView = UIImageView()
        ufoView.contentMode = UIView.ContentMode.scaleAspectFit
        ufoView.frame.size.width = ufoSize
        ufoView.frame.size.height = ufoSize
        ufoView.frame.origin.x = CGFloat(xCoordinate)
        ufoView.frame.origin.y = self.view.frame.minY //+ ufoView.frame.size.height
        ufoView.backgroundColor = .clear
        ufoView.image = ufo
        
        self.view.addSubview(ufoView)
        return ufoView
    }
    
    // MARK: Crash
    
    func crash() {
        let alert = UIAlertController(title: "Attention!", message: "GAME OVER", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
        
        self.timerModel.stopGameTimer()
    }
}

