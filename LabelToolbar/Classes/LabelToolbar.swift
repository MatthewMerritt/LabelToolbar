//
//  LabelToolbar.swift
//  Exercise
//
//  Created by Matthew Merritt on 4/30/20.
//  Copyright © 2020 Matthew Merritt. All rights reserved.
//

import UIKit

public class LabelToolbar: UIBarButtonItem {

    // MARK: Property Helpers
    public typealias ButtonAction = (_ label: Label) -> Void

    public enum Label {
        case left, middle, right
    }

    // MARK: Private Properties
    private lazy var fixed: UIBarButtonItem = {
        let fixed = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixed.width = 10

        return fixed
    }()

    private lazy var flexible: UIBarButtonItem = {
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        return flexible
    }()

    private lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = titleFont
        button.isUserInteractionEnabled = false

        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.clear.cgColor

        button.layer.shadowOpacity = 0
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 1, height: 2)
        button.layer.shadowColor = UIColor.link.cgColor

        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(leftButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var middleButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = titleFont
        button.isUserInteractionEnabled = false

        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.clear.cgColor

        button.layer.shadowOpacity = 0
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 1, height: 2)
        button.layer.shadowColor = UIColor.link.cgColor

        button.addTarget(self, action: #selector(middleButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = titleFont
        button.isUserInteractionEnabled = false

        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.clear.cgColor

        button.layer.shadowOpacity = 0
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 1, height: 2)
        button.layer.shadowColor = UIColor.link.cgColor

        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(righttButtonAction(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: Public Properties
    public var leftButtonActionClosure: ButtonAction? = nil {
        didSet {
            if leftButtonActionClosure != nil {
                leftButton.isUserInteractionEnabled = true
//                leftButton.layer.borderColor = UIColor.secondarySystemBackground.darker(by: 15)?.cgColor
                leftButton.backgroundColor = .secondarySystemBackground

                leftButton.layer.shadowOpacity = 0.35
                leftButton.layer.shadowColor = UIColor.secondarySystemBackground.darker()?.cgColor

            } else {
                leftButton.isUserInteractionEnabled = false
                leftButton.layer.borderColor = UIColor.clear.cgColor
                leftButton.backgroundColor = .clear

                leftButton.layer.shadowOpacity = 0
            }
        }
    }

    public var middleButtonActionClosure: ButtonAction? = nil {
        didSet {
            if middleButtonActionClosure != nil {
                middleButton.isUserInteractionEnabled = true
//                middleButton.layer.borderColor = UIColor.secondarySystemBackground.darker(by: 15)?.cgColor
                middleButton.backgroundColor = .secondarySystemBackground

                middleButton.layer.shadowOpacity = 0.35
                middleButton.layer.shadowColor = UIColor.secondarySystemBackground.darker()?.cgColor

            } else {
                middleButton.isUserInteractionEnabled = false
                middleButton.layer.borderColor = UIColor.clear.cgColor
                middleButton.backgroundColor = .clear

                middleButton.layer.shadowOpacity = 0
            }

        }
    }

    public var rightButtonActionClosure: ButtonAction? = nil {
        didSet {
            if rightButtonActionClosure != nil {
                rightButton.isUserInteractionEnabled = true
//                rightButton.layer.borderColor = UIColor.secondarySystemBackground.darker(by: 15)?.cgColor
                rightButton.backgroundColor = .secondarySystemBackground

                rightButton.layer.shadowOpacity = 0.35
                rightButton.layer.shadowColor = UIColor.secondarySystemBackground.darker()?.cgColor
            } else {
                rightButton.isUserInteractionEnabled = false
                rightButton.layer.borderColor = UIColor.clear.cgColor
                rightButton.backgroundColor = .clear

                rightButton.layer.shadowOpacity = 0
            }

        }
    }

    public var titleFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            var label = leftButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .left, title: String(label.first! + ":"), detail: String(label.last!))

            label = middleButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .middle, title: String(label.first! + ":"), detail: String(label.last!))

            label = rightButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .right, title: String(label.first! + ":"), detail: String(label.last!))
        }
    }

    public var detailFont: UIFont = UIFont.boldSystemFont(ofSize: 16) {
        didSet {
            var label = leftButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .left, title: String(label.first! + ":"), detail: String(label.last!))

            label = middleButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .middle, title: String(label.first! + ":"), detail: String(label.last!))

            label = rightButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: ":")
            setAttributedText(for: .right, title: String(label.first! + ":"), detail: String(label.last!))
        }
    }

    public var items: [UIBarButtonItem] {
        let lButton = UIBarButtonItem(customView: leftButton)
        let mButton = UIBarButtonItem(customView: middleButton)
        let rButton = UIBarButtonItem(customView: rightButton)

        return [fixed, lButton, flexible, mButton, flexible, rButton, fixed]
    }

}

// MARK: - NSAttributedString
public extension LabelToolbar {

    func setAttributedText(for label: Label, title: String, detail: String) {
        let attrLabel = NSAttributedString(string: " " + title, attributes: [.foregroundColor : UIColor.label, .font : titleFont])
        let attrDetail = NSAttributedString(string: detail + " ", attributes: [.foregroundColor : tintColor ?? .systemBlue, .font : detailFont])

        let combined = NSMutableAttributedString(attributedString: attrLabel)
        combined.append(attrDetail)

        switch label {
        case .left:
            let leftText = leftButtonActionClosure != nil ? combined.add(NSUnderlineStyle.single, color: .link) : combined
            leftButton.setAttributedTitle(leftText, for: .normal)
            leftButton.sizeToFit()

        case .middle:
            let middleText = middleButtonActionClosure != nil ? combined.add(NSUnderlineStyle.single, color: .link) : combined
            middleButton.setAttributedTitle(middleText, for: .normal)
            middleButton.sizeToFit()

        case .right:
            let rightText = rightButtonActionClosure != nil ? combined.add(NSUnderlineStyle.single, color: .link) : combined
            rightButton.setAttributedTitle(rightText, for: .normal)
            rightButton.sizeToFit()
        }
    }

}

// MARK: - Button Actions
fileprivate extension LabelToolbar {

    @objc func leftButtonAction(_ sender: UIButton) {
        leftButtonActionClosure?(.left)
    }

    @objc func middleButtonAction(_ sender: UIButton) {
        middleButtonActionClosure?(.left)
    }

    @objc func righttButtonAction(_ sender: UIButton) {
        rightButtonActionClosure?(.left)
    }

}

// MARK: - NSAttributedString Helpers
fileprivate extension NSAttributedString {

    func add(_ style: NSUnderlineStyle = NSUnderlineStyle.single, color: UIColor) -> NSAttributedString {

        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.addAttribute(.underlineStyle, value: style.rawValue, range: NSMakeRange(0, self.length))
        mutable.addAttribute(.underlineColor, value: color, range: NSMakeRange(0, self.length))

        return mutable
    }

    func add(_ attributes: [NSAttributedString.Key : Any]) -> NSAttributedString {

        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.addAttributes(attributes, range: NSMakeRange(0, self.length))

        return mutable
    }

}

// MARK: - UIColor
fileprivate extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red:   min(red   + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue:  min(blue  + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

