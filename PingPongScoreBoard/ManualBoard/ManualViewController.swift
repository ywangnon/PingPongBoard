//
//  ManualViewController.swift
//  PingPongScoreBoard
//
//  Created by Hansub Yoo on 2020/05/04.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
//    var manualView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 10
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    var tapImgView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.image = UIImage(systemName: "smallcircle.fill.circle")
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        return imgView
//    }()
//    
//    var tapLabel: UILabel = {
//        let label = UILabel()
//        label.text = "점수 올리기"
//        label.font = .systemFont(ofSize: 18, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    var downImgView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.image = UIImage(systemName: "arrow.down.circle")
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        return imgView
//    }()
//    
//    var downLabel: UILabel = {
//        let label = UILabel()
//        label.text = "점수 내리기"
//        label.font = .systemFont(ofSize: 18, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    var longImgView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.image = UIImage(systemName: "largecircle.fill.circle")
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        return imgView
//    }()
//    
//    var longLabel: UILabel = {
//        let label = UILabel()
//        label.text = "점수 초기화"
//        label.font = .systemFont(ofSize: 18, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    var closeButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("닫기", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 12
//        button.backgroundColor = .black
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setViewFoundations()
//        self.setAddSubViews()
//        self.setLayouts()
//        self.setAddTargets()
    }
    
//    func setViewFoundations() {
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//    }
//
//    func setAddSubViews() {
//        self.view.addSubview(self.manualView)
//        self.view.addSubview(self.closeButton)
//        self.manualView.addSubview(self.tapImgView)
//        self.manualView.addSubview(self.tapLabel)
//        self.manualView.addSubview(self.downImgView)
//        self.manualView.addSubview(self.downLabel)
//        self.manualView.addSubview(self.longImgView)
//        self.manualView.addSubview(self.longLabel)
//    }
//
//    func setLayouts() {
//        NSLayoutConstraint.activate([
//            self.manualView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.manualView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.manualView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
//            self.manualView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.closeButton.widthAnchor.constraint(equalTo: self.manualView.widthAnchor, multiplier: 0.5),
//            self.closeButton.heightAnchor.constraint(equalToConstant: 24),
//            self.closeButton.centerXAnchor.constraint(equalTo: self.manualView.centerXAnchor),
//            self.closeButton.bottomAnchor.constraint(equalTo: self.manualView.bottomAnchor, constant: -8)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.tapImgView.widthAnchor.constraint(equalToConstant: 48),
//            self.tapImgView.heightAnchor.constraint(equalToConstant: 48),
//            self.tapImgView.leadingAnchor.constraint(equalTo: self.manualView.leadingAnchor, constant: 16),
//            self.tapImgView.topAnchor.constraint(equalTo: self.manualView.topAnchor, constant: 16)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.tapLabel.centerYAnchor.constraint(equalTo: self.tapImgView.centerYAnchor),
//            self.tapLabel.leadingAnchor.constraint(equalTo: self.tapImgView.trailingAnchor, constant: 16)
//        ])
//        self.tapLabel.sizeToFit()
//
//        NSLayoutConstraint.activate([
//            self.downImgView.widthAnchor.constraint(equalToConstant: 48),
//            self.downImgView.heightAnchor.constraint(equalToConstant: 48),
//            self.downImgView.leadingAnchor.constraint(equalTo: self.manualView.leadingAnchor, constant: 16),
//            self.downImgView.topAnchor.constraint(equalTo: self.tapImgView.bottomAnchor, constant: 16)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.downLabel.centerYAnchor.constraint(equalTo: self.downImgView.centerYAnchor),
//            self.downLabel.leadingAnchor.constraint(equalTo: self.downImgView.trailingAnchor, constant: 16)
//        ])
//        self.downLabel.sizeToFit()
//
//        NSLayoutConstraint.activate([
//            self.longImgView.widthAnchor.constraint(equalToConstant: 48),
//            self.longImgView.heightAnchor.constraint(equalToConstant: 48),
//            self.longImgView.leadingAnchor.constraint(equalTo: self.manualView.leadingAnchor, constant: 16),
//            self.longImgView.topAnchor.constraint(equalTo: self.downImgView.bottomAnchor, constant: 16)
//        ])
//
//        NSLayoutConstraint.activate([
//            self.longLabel.centerYAnchor.constraint(equalTo: self.longImgView.centerYAnchor),
//            self.longLabel.leadingAnchor.constraint(equalTo: self.longImgView.trailingAnchor, constant: 16)
//        ])
//        self.longLabel.sizeToFit()
//    }
//
//    func setAddTargets() {
//        self.closeButton.addTarget(self, action: #selector(self.closeButton(_:)), for: .touchUpInside)
//    }
}

extension ManualViewController {
//    @objc func closeButton(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
}
