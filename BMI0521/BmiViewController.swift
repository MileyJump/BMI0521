//
//  ViewController.swift
//  BMI0521
//
//  Created by 최민경 on 5/21/24.
//

import UIKit

class BmiViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func designLabelUI(_ label: UILabel, textLabel: String) {
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.text = textLabel
        label.numberOfLines = 0
    }
    
    func designTextFieldUI(_ textField: UITextField){
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 2
    }
    
    func setUpUI(){
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textColor = .black
        titleLabel.text = "BMI Calculator"
        
        
        
        designLabelUI(subTitleLabel, textLabel: "당신의 BMI 지수를 \n알려드릴게요")
        designLabelUI(heightLabel, textLabel: "키가 어떻게 되시나요?")
        designLabelUI(weightLabel, textLabel: "몸무게는 어떻게 되시나요?")
        
        designTextFieldUI(heightTextField)
        designTextFieldUI(weightTextField)
        
        
        
        randomButton.tintColor = .red
        randomButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomButton.titleLabel?.font = .systemFont(ofSize: 14)
        
        
        
        
        resultButton.backgroundColor = .purple
        resultButton.tintColor = .white
        resultButton.layer.cornerRadius = 15
        resultButton.setTitle("결과 확인", for: .normal)
    }
    
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        
        let randomHeight = Int.random(in: 130...200)
        let randomWeight = Int.random(in: 40...120)
        
        weightTextField.text = "\(randomWeight)"
        heightTextField.text = "\(randomHeight)"
        
        
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        present(alert, animated: true)
        
        let weight = weightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let height = heightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        guard let weight = Double(weight) else { return }
        guard let height = Double(height) else { return }
        
        
        let heightm = height/100
        let bmi = weight / (heightm * heightm)
        
        
        switch bmi {
        case ...18.5:
            alert.title = "저체중"
        case 18.6...23:
            alert.title = "정상"
        case 24.1...25.0:
            alert.title = "과체중"
        case 25.1...: alert.title = "비만"
        default:
            print("값 없음")
        }
    }
    
    
    
    
}
