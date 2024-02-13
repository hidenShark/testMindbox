//
//  CircleViewController.swift
//  areaСalculation
//
//  Created by Илья Акулов on 12.02.2024.
//

import UIKit

class CircleViewController: UIViewController {
    
    let radiusLabel = UILabel()
    let radiusTextField = UITextField()
    let radiusImageView = UIImageView()
    let calculateButton = UIButton()
    let answerLabel = UILabel()
    var radius: Double = 0.0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRadiusLabel()
        createRadiusTextField()
        createRadiusImageView()
        createCalculateButton()
        createAnswerLabel()
    }
    
    // MARK: - Создем лейбл для радиуса

    func createRadiusLabel() {
        radiusLabel.text = "Введите радуиус r="
        view.addSubview(radiusLabel)
        
        radiusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radiusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            radiusLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            radiusLabel.widthAnchor.constraint(equalToConstant: 170),
            radiusLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
   
    // MARK: - Создаем textField для ввода радиуса пользователем

    func createRadiusTextField() {
        radiusTextField.borderStyle = .roundedRect
        radiusTextField.textAlignment = .center
        radiusTextField.keyboardType = .numberPad
        radiusTextField.delegate = self
        view.addSubview(radiusTextField)
        radiusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            radiusTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            radiusTextField.leftAnchor.constraint(equalTo: radiusLabel.rightAnchor, constant: 0),
            radiusTextField.widthAnchor.constraint(equalToConstant: 40),
            radiusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Создаем картинку

    func createRadiusImageView() {
        radiusImageView.image = UIImage(named: "ploshchadKruga")
        view.addSubview(radiusImageView)
        radiusImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            radiusImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            radiusImageView.bottomAnchor.constraint(equalTo: radiusLabel.topAnchor, constant: -50),
            radiusImageView.widthAnchor.constraint(equalToConstant: 200),
            radiusImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: - Создаем кнопку для вычисления

    func createCalculateButton() {
        calculateButton.setTitle("Расчитать", for: .normal)
        calculateButton.setTitleColor(.black, for: .normal)
        calculateButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        view.addSubview(calculateButton)
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: radiusLabel.bottomAnchor, constant: 50),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 150),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Создаем лейбл для ответа

    func createAnswerLabel() {
        
        answerLabel.text = "Ответ:"
        answerLabel.textAlignment = .center
        view.addSubview(answerLabel)
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 50),
            answerLabel.widthAnchor.constraint(equalToConstant: 150),
            answerLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Создаем действие для кнопки расчета

    @objc func calculateButtonTapped() {

        if let radiusText = radiusTextField.text, let radius = Double(radiusText) {
            let circle = Circle(radius: radius)
            let circleArea = circle.getArea()
            print("Площадь круга: \(circleArea)")
            answerLabel.text = "Ответ: \(circleArea)"
        } else {
            answerLabel.text = "Неверное значение радиуса"
        }
    }
}


// MARK: - UITextFieldDelegate

extension CircleViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == radiusTextField {
            radiusTextField.resignFirstResponder()
        }
        return true
        
    }
}
