//
//  TriangleViewController.swift
//  areaСalculation
//
//  Created by Илья Акулов on 12.02.2024.
//

import UIKit

class TriangleViewController: UIViewController {
    
    let sideALabel = UILabel()
    let sideBLabel = UILabel()
    let sideCLabel = UILabel()
    
    let sideATextField = UITextField()
    let sideBTextField = UITextField()
    let sideCTextField = UITextField()
    
    let calculateButton = UIButton()
    let triangleImageView = UIImageView()
    let answerLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSideLabel()
        createSideTextField()
        createCalculateButton()
        createTriangleImageView()
        createAnswerLabel()
    }
    
    // MARK: - Создаем лейблы для сторон треугольника

    func createSideLabel() {
        sideALabel.text = "Введите сторону A="
        view.addSubview(sideALabel)
        
        sideALabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideALabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sideALabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            sideALabel.widthAnchor.constraint(equalToConstant: 170),
            sideALabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        sideBLabel.text = "Введите сторону B="
        view.addSubview(sideBLabel)
        
        sideBLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideBLabel.topAnchor.constraint(equalTo: sideALabel.bottomAnchor, constant: 20),
            sideBLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            sideBLabel.widthAnchor.constraint(equalToConstant: 170),
            sideBLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        sideCLabel.text = "Введите сторону C="
        view.addSubview(sideCLabel)
        
        sideCLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideCLabel.topAnchor.constraint(equalTo: sideBLabel.bottomAnchor, constant: 20),
            sideCLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            sideCLabel.widthAnchor.constraint(equalToConstant: 170),
            sideCLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Создаем textField для заполнения пользователем

    func createSideTextField() {
        //
        sideATextField.borderStyle = .roundedRect
        sideATextField.textAlignment = .center
        sideATextField.keyboardType = .numberPad
        sideATextField.delegate = self
        view.addSubview(sideATextField)
        sideATextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sideATextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sideATextField.leftAnchor.constraint(equalTo: sideALabel.rightAnchor, constant: 0),
            sideATextField.widthAnchor.constraint(equalToConstant: 40),
            sideATextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //
        sideBTextField.borderStyle = .roundedRect
        sideBTextField.textAlignment = .center
        sideBTextField.keyboardType = .numberPad
        sideBTextField.delegate = self
        view.addSubview(sideBTextField)
        sideBTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sideBTextField.centerYAnchor.constraint(equalTo: sideBLabel.centerYAnchor),
            sideBTextField.leftAnchor.constraint(equalTo: sideBLabel.rightAnchor, constant: 0),
            sideBTextField.widthAnchor.constraint(equalToConstant: 40),
            sideBTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //
        sideCTextField.borderStyle = .roundedRect
        sideCTextField.textAlignment = .center
        sideCTextField.keyboardType = .numberPad
        sideCTextField.delegate = self
        view.addSubview(sideCTextField)
        sideCTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sideCTextField.centerYAnchor.constraint(equalTo: sideCLabel.centerYAnchor),
            sideCTextField.leftAnchor.constraint(equalTo: sideCLabel.rightAnchor, constant: 0),
            sideCTextField.widthAnchor.constraint(equalToConstant: 40),
            sideCTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Создаем кнопку для вычисления

    func createCalculateButton() {
        calculateButton.setTitle("Расчитать", for: .normal)
        calculateButton.setTitleColor(.black, for: .normal)
        calculateButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        //        calculateButton.layer.cornerRadius = calculateButton.frame.size.height / 2
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        view.addSubview(calculateButton)
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: sideCLabel.bottomAnchor, constant: 30),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 150),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Создаем картинку

    func createTriangleImageView() {
        triangleImageView.image = UIImage(named: "triangle")
        view.addSubview(triangleImageView)
        triangleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            triangleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            triangleImageView.bottomAnchor.constraint(equalTo: sideALabel.topAnchor, constant: -50),
            triangleImageView.widthAnchor.constraint(equalToConstant: 236),
            triangleImageView.heightAnchor.constraint(equalToConstant: 148)
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
            answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 30),
            answerLabel.widthAnchor.constraint(equalToConstant: 150),
            answerLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Создаем действие для кнопки расчета

    @objc func calculateButtonTapped() {
        
        if let sideAText = sideATextField.text, let sideA = Double(sideAText),
           let sideBText = sideBTextField.text, let sideB = Double(sideBText),
           let sideCText = sideCTextField.text, let sideC = Double(sideCText) {
            let triangle = Triangle(sideA: sideA, sideB: sideB, sideC: sideC)
            let triangleArea = triangle.getArea()
            answerLabel.text = "Ответ: \(triangleArea)"
            print("Площадь треугольника: \(triangleArea)")
            
            if triangle.isRightTriangle() {
                print("Треугольник является прямоугольным")
            } else {
                print("Треугольник не является прямоугольным")
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension TriangleViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == sideATextField  {
            sideATextField.resignFirstResponder()
        }
        else if textField == sideBTextField  {
            sideBTextField.resignFirstResponder()
        }
        else if textField == sideCTextField  {
            sideCTextField.resignFirstResponder()
        }
        return true
    }
}

