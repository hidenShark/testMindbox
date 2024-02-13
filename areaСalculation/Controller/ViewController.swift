//
//  ViewController.swift
//  areaСalculation
//
//  Created by Илья Акулов on 12.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let figureTextField = UITextField()
    let okButton = UIButton()
    let clearButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        createFigureTextField()
        createOkButton()
        createClearButton()
        
    }
    
    // MARK: - Создаем textField для ввода фигуры

    func createFigureTextField() {
        figureTextField.placeholder = "Введите название фигуры"
        figureTextField.borderStyle = .roundedRect
        view.addSubview(figureTextField)
        figureTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            figureTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            figureTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            figureTextField.widthAnchor.constraint(equalToConstant: 250),
            figureTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Создаем кнопку вперед

    func createOkButton() {
        okButton.setTitle("Ok", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        view.addSubview(okButton)
        
        okButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            okButton.topAnchor.constraint(equalTo: figureTextField.bottomAnchor, constant: 50),
            okButton.leftAnchor.constraint(equalTo: figureTextField.leftAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 100),
            okButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    // MARK: - Создаем кнопку очистки

    func createClearButton() {
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        view.addSubview(clearButton)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: figureTextField.bottomAnchor, constant: 50),
            clearButton.rightAnchor.constraint(equalTo: figureTextField.rightAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 100),
            clearButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    // MARK: - Создаем действие для кнопки вперед

    @objc func okButtonTapped() {
        if figureTextField.text == "Круг" {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Circle") as? CircleViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else if figureTextField.text == "Треугольник" {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Triangle") as? TriangleViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    // MARK: - Создаем действие для кнопки очистки

    @objc func clearButtonTapped() {
        figureTextField.text = ""
    }
}

