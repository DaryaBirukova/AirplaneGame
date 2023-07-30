//
//  SettingsViewController.swift
//  AirplaneGame
//
//  Created by Дарья Бирюкова on 06.07.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let backView = UIView()
    private let imageButton = UIButton()
    private let userImage = UIImage(named: "userImage.png")
    private let imageView = UIImageView()
    private var imageIsChanged = false
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let airplaneTypesLabel = UILabel()
    private let airplaneOneImage = UIImage(named: "plane.png")
    private let airplaneOneView = UIImageView()
    private let airplaneOneButton = UIButton()
    private let airplaneTwoImage = UIImage(named: "airplanetype2.png")
    private let airplaneTwoView = UIImageView()
    private let airplaneTwoButton = UIButton()
    private let airplaneThreeImage = UIImage(named: "airplanetype3.png")
    private let airplaneThreeView = UIImageView()
    private let airplaneThreeButton = UIButton()
    private let speedLabel = UILabel()
    private let speedStepper = UIStepper()
    private let saveButton = UIButton()
    
    private let imageSize = CGFloat(100)
    private let labelWidth = CGFloat(200)
    private let labelHeight = CGFloat(30)
    private let textFieldWidth = CGFloat(180)
    private let textFieldHeight = CGFloat(30)
    private let airplaneImageSize = CGFloat(80)
    private let airplaneButtonSize = CGFloat(86)
    private let areaBetweenAirplaneButtonAndImage = CGFloat(3)
    private let speedStepperWidth = CGFloat(60)
    private let speedStepperHeight = CGFloat(40)
    private let saveButtonWidth = CGFloat(80)
    private let saveButtonHeight = CGFloat(40)
    private let areaBetweenFields = CGFloat(30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSettingsUI()
    }
    
    @objc func imageButtonPressed(sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func speedStepperPressed(sender: UIStepper) {
        let selectedSpeed = Double(sender.value)
        speedLabel.text = "Game speed: \(selectedSpeed)"
    }
    
    @objc func aiplaneOneHasBeenChoosen(sender: UITapGestureRecognizer) {
        airplaneOneButton.backgroundColor = .systemBlue
        airplaneTwoButton.backgroundColor = .clear
        airplaneThreeButton.backgroundColor = .clear
        airplaneTypesLabel.text = "Choose your airplane: type 1"
    }
    
    @objc func aiplaneTwoHasBeenChoosen(sender: UITapGestureRecognizer) {
        airplaneTwoButton.backgroundColor = .systemBlue
        airplaneOneButton.backgroundColor = .clear
        airplaneThreeButton.backgroundColor = .clear
        airplaneTypesLabel.text = "Choose your airplane: type 2"
    }
    
    @objc func aiplaneThreeHasBeenChoosen(sender: UITapGestureRecognizer) {
        airplaneThreeButton.backgroundColor = .systemBlue
        airplaneOneButton.backgroundColor = .clear
        airplaneTwoButton.backgroundColor = .clear
        airplaneTypesLabel.text = "Choose your airplane: type 3"
    }
    
    // MARK: - Save data
    @objc func saveButtonPressed(sender: UITapGestureRecognizer) {
        UserSettings.userName = nameTextField.text!
        print(UserSettings.userName)
        nameLabel.text = "Name: \(UserSettings.userName)"
        
        UserSettings.airplaneType = airplaneTypesLabel.text!
        print(UserSettings.airplaneType)
        airplaneTypesLabel.text = "Choose your airplane: \(UserSettings.airplaneType)"
        
        UserSettings.gameSpeed = speedStepper.value
        print(UserSettings.gameSpeed)
        speedLabel.text = "Game speed: \(UserSettings.gameSpeed)"
        
        dismiss(animated: true)
    }
    
    func addSettingsUI() {
        backView.frame = CGRect(x: view.frame.minX,
                                y: view.frame.minY,
                                width: view.frame.maxX,
                                height: view.frame.maxY
        )
        backView.backgroundColor = .white
        self.view.addSubview(backView)
        
        // MARK: - UserImage
        
        imageButton.frame = CGRect(x: view.frame.minX + areaBetweenFields,
                                   y: view.frame.minY + areaBetweenFields,
                                   width: imageSize,
                                   height: imageSize
        )
        imageButton.backgroundColor = .clear
        imageButton.addTarget(self, action: #selector(imageButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(imageButton)
        
        imageView.frame = CGRect(x: view.frame.minX + areaBetweenFields,
                                 y: view.frame.minY + areaBetweenFields,
                                 width: imageSize,
                                 height: imageSize
        )
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.backgroundColor = .systemGray2
        imageView.image = userImage
        self.view.addSubview(imageView)
        
        // MARK: - UserName
        
        nameLabel.frame = CGRect(x: view.frame.midX - areaBetweenFields,
                                 y: view.frame.minY + 2 * areaBetweenFields,
                                 width: labelWidth,
                                 height: labelHeight
        )
        nameLabel.text = "Name: \(UserSettings.userName)"
        self.view.addSubview(nameLabel)
        
        nameTextField.frame = CGRect(x: view.frame.midX - areaBetweenFields,
                                     y: view.frame.minY + 3 * areaBetweenFields,
                                     width: textFieldWidth,
                                     height: textFieldHeight
        )
        nameTextField.placeholder = "Enter your name here..."
        self.view.addSubview(nameTextField)
        
        // MARK: - Airplane types
        
        airplaneTypesLabel.frame = CGRect(x: view.frame.minX + areaBetweenFields,
                                          y: view.frame.minX + imageSize + 2 * areaBetweenFields,
                                          width: labelWidth * 2,
                                          height: labelHeight
        )
        airplaneTypesLabel.text = "\(UserSettings.airplaneType)"
        self.view.addSubview(airplaneTypesLabel)
        
        airplaneOneButton.frame = CGRect(x: view.frame.minX + areaBetweenFields - areaBetweenAirplaneButtonAndImage,
                                         y: view.frame.minY + 7 * areaBetweenFields - areaBetweenAirplaneButtonAndImage,
                                         width: airplaneButtonSize,
                                         height: airplaneButtonSize
        )
        airplaneOneButton.backgroundColor = .clear
        airplaneOneButton.addTarget(self, action: #selector(aiplaneOneHasBeenChoosen), for: .touchUpInside)
        self.view.addSubview(airplaneOneButton)
        
        airplaneOneView.frame = CGRect(x: view.frame.minX + areaBetweenFields,
                                       y: view.frame.minY + 7 * areaBetweenFields,
                                       width: airplaneImageSize,
                                       height: airplaneImageSize
        )
        airplaneOneView.contentMode = UIView.ContentMode.scaleAspectFit
        airplaneOneView.backgroundColor = .white
        airplaneOneView.image = airplaneOneImage
        self.view.addSubview(airplaneOneView)
        
        airplaneTwoButton.frame = CGRect(x: view.frame.midX - airplaneImageSize / 2 - areaBetweenAirplaneButtonAndImage,
                                         y: view.frame.minY + 7 * areaBetweenFields - areaBetweenAirplaneButtonAndImage,
                                         width: airplaneButtonSize,
                                         height: airplaneButtonSize
        )
        airplaneTwoButton.backgroundColor = .clear
        airplaneTwoButton.addTarget(self, action: #selector(aiplaneTwoHasBeenChoosen), for: .touchUpInside)
        self.view.addSubview(airplaneTwoButton)
        
        airplaneTwoView.frame = CGRect(x: view.frame.midX - airplaneImageSize / 2,
                                       y: view.frame.minY + 7 * areaBetweenFields,
                                       width: airplaneImageSize,
                                       height: airplaneImageSize
        )
        airplaneTwoView.contentMode = UIView.ContentMode.scaleAspectFit
        airplaneTwoView.backgroundColor = .white
        airplaneTwoView.image = airplaneTwoImage
        self.view.addSubview(airplaneTwoView)
        
        airplaneThreeButton.frame = CGRect(x: view.frame.maxX - airplaneImageSize - areaBetweenFields - areaBetweenAirplaneButtonAndImage,
                                           y: view.frame.minY + 7 * areaBetweenFields - areaBetweenAirplaneButtonAndImage,
                                           width: airplaneButtonSize,
                                           height: airplaneButtonSize
        )
        airplaneThreeButton.backgroundColor = .clear
        airplaneThreeButton.addTarget(self, action: #selector(aiplaneThreeHasBeenChoosen), for: .touchUpInside)
        self.view.addSubview(airplaneThreeButton)
        
        airplaneThreeView.frame = CGRect(x: view.frame.maxX - airplaneImageSize - areaBetweenFields,
                                         y: view.frame.minY + 7 * areaBetweenFields,
                                         width: airplaneImageSize,
                                         height: airplaneImageSize
        )
        airplaneThreeView.contentMode = UIView.ContentMode.scaleAspectFit
        airplaneThreeView.backgroundColor = .white
        airplaneThreeView.image = airplaneThreeImage
        self.view.addSubview(airplaneThreeView)
        
        // MARK: - Game speed
        
        speedLabel.frame = CGRect(x: view.frame.minX + areaBetweenFields,
                                  y: view.frame.midY - areaBetweenFields - speedStepperHeight,
                                  width: labelWidth,
                                  height: labelHeight
        )
        speedLabel.text = "Game speed: \(UserSettings.gameSpeed)"
        self.view.addSubview(speedLabel)
        
        speedStepper.frame = CGRect(x: view.frame.maxX - 2 * areaBetweenFields - speedStepperWidth,
                                    y: view.frame.midY - areaBetweenFields - speedStepperHeight,
                                    width: speedStepperWidth,
                                    height: speedStepperHeight)
        speedStepper.minimumValue = 0.5
        speedStepper.maximumValue = 5.0
        speedStepper.stepValue = 0.5
        speedStepper.addTarget(self, action: #selector(speedStepperPressed(sender:)), for: .valueChanged)
        self.view.addSubview(speedStepper)
        
        // MARK: - Save button
        
        saveButton.frame = CGRect(x: view.frame.midX - saveButtonWidth / 2,
                                  y: view.frame.midY,
                                  width: saveButtonWidth,
                                  height: saveButtonHeight
        )
        saveButton.backgroundColor = .systemGreen
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 7
        saveButton.addTarget(self, action: #selector(saveButtonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(saveButton)
    }
}

extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
