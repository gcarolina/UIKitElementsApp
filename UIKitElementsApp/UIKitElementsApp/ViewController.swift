//
//  ViewController.swift
//  UIKitElementsApp
//
//  Created by Carolina on 22.10.22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var buttonSave: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var hideLabel: UILabel!
    @IBOutlet weak var hideSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            infoLabel.text = "The first segment is selected"
            infoLabel.textColor = .systemPurple
        case 1:
            infoLabel.text = "The second segment is selected"
            infoLabel.textColor = .purple
        case 2:
            infoLabel.text = "The third segment is selected"
            infoLabel.textColor = .systemIndigo
        default: break
        }
    }
    
    
    @IBAction func sliderAction() {
        print(slider.value)
        let backgroundColor = view.backgroundColor
        view.backgroundColor = backgroundColor?.withAlphaComponent(Double(slider.value))
        infoLabel.text = String(slider.value)
    }
    
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        print(sender.text)
    }
    
    
    @IBAction func clickOnSave() {
        print("button action")
        guard let inputText = textField.text, inputText.count > 3 else {
            showAlert(title: "Wrong format!", message: "Please enter your name")
            print("Wrong format")
            return
        }
        infoLabel.text = inputText
        textField.text = nil
    }
    
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        print(sender.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale.current
        
        let dateValue = dateFormatter.string(from: datePicker.date)
        infoLabel.text = dateValue
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        print(sender.isOn)
        segmentedControl.isHidden.toggle()
        infoLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        buttonSave.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        hideLabel.text = hideSwitch.isOn ? "Отобразить все элементы" : "Скрыть все элементы"
    }
    
    private func setupUI() {
        // Setup infoLabel
        infoLabel.font = infoLabel.font.withSize(35)
        infoLabel.textAlignment = .center
        //infoLabel.numberOfLines = 2
        
        // Setup segmented control
//        segmentedControl.insertSegment(withTitle: "Fifth", at: 3, animated: true)
//        segmentedControl.selectedSegmentIndex = 2
//
        // Setup slider
//        slider.value = 1
//        slider.minimumValue = 0
//        slider.maximumValue = 1
//        slider.minimumTrackTintColor = .yellow
//        slider.maximumTrackTintColor = .purple
//        slider.thumbTintColor = .blue
        // slider value to mainLabel
        infoLabel.text = String(slider.value)
        
        // Setup Date Picker
        //datePicker.locale = Locale(identifier: "ru_RU")
        
        // Локализация в соответствии с текущими настройками системы
        datePicker.locale = Locale.current
        
        //hideSwitch.onTintColor = .red
        hideLabel.text = "Скрыть все элементы"
    }
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
           // print("Тут можем что-то сделать после нажатия на 'OK'")
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


