//
//  ViewController.swift
//  MyDrawingApp
//
//  Created by Taha Ishfaq on 2019-11-20.
//  Copyright © 2019 Taha Ishfaq. All rights reserved.
//

import UIKit
    
    class ViewController: UIViewController{
        
        let drawingBoard = DrawingBoard()
       
        let undoButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Undo", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 12)
            button.addTarget(self, action: #selector(UndoButton), for: .touchUpInside)
            return button
            
        }()
        let ClearButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Clear", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 12)
            button.addTarget(self, action: #selector(clearButton), for: .touchUpInside)
            return button
        }()
        
        let slider: UISlider = {
            let slider = UISlider()
            slider.minimumValue = 1
            slider.maximumValue = 10
            slider.addTarget(self, action: #selector(sliderSlide) , for: .valueChanged)
            return slider
        }()
        
        let ShareButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Share", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 12)
            button.addTarget(self, action: #selector(shareButton), for: .touchUpInside)
            return button
        }()

        @objc func shareButton(_ sender: Any) {
            let activityVC = UIActivityViewController(activityItems: [drawingBoard], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil )
            
            UIGraphicsBeginImageContext(view.frame.size)
            
        }
        
        
        @objc func sliderSlide(){
            drawingBoard.setStrokeWidth(width: slider.value)
        }

        @objc func clearButton(){
            drawingBoard.clear()
            
        }

        @objc func UndoButton(){
            drawingBoard.undo()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(drawingBoard)
            drawingBoard.backgroundColor = .white
            drawingBoard.frame = view.frame
            
        let stackView = UIStackView(arrangedSubviews: [ undoButton, ClearButton, slider, ShareButton])
            view.addSubview(stackView)
            stackView.distribution = .fillEqually
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
        }
    }

