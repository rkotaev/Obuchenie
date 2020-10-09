//
//  ViewController.swift
//  Ruslan228
//
//  Created by Project K Developer on 05.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1  
        
        label.text = String(slider.value)
        //  label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        label.numberOfLines = 2
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "Вы выбрали первый сегмент"
            label.textColor = .red
        case 1:
            label.text = "Вы выбрали второй сегмент"
            label.textColor = .blue
        case 2:
            label.text = "Вы выбрали третий сегмент"
            label.textColor = .yellow
        default:
            print("Не сработало")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgrandColor = self.view.backgroundColor
        self.view.backgroundColor = backgrandColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else  { return }
        
        if let _ = Double(textField.text!) {
            
            let alert = UIAlertController(title: "Wrong Format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            print("Name format is wrong")
        } else {
            label.text = textField.text
            label.text = nil 
        }
    }
}

