//
//  UIView+Extensions.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
        
    }
    
}

//
//  UIView+Extensions.swift
//  SegaPlato
//
//  Created by 盧 思聰 on 2018/08/14.
//  Copyright © 2018年 bravesoft inc. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 枠用
@IBDesignable
extension UIView {
    
    /// 枠の幅さ
    @IBInspectable
    var borderWidth: CGFloat {
        
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
        
    }
    
    /// 枠のカラー
    @IBInspectable
    var borderColor: UIColor {
        
        get {
            guard let color = self.layer.borderColor else {
                return UIColor.clear
            }
            return UIColor.init(cgColor: color)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
        
    }
    
}


// MARK: - シャドー用
@IBDesignable
extension UIView {
    
    // MARK: - シャドー位置
    @IBInspectable
    var shadowOffset: CGSize {
        
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
            self.layer.shadowOpacity = 1
        }
        
    }
    
    // MARK: - シャドーカラー
    @IBInspectable
    var shadowColor: UIColor {
        
        get {
            guard let color = self.layer.shadowColor else {
                return UIColor.clear
            }
            return UIColor.init(cgColor: color)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            
        }
        
    }
    
    // MARK: - シャドー半径
    @IBInspectable
    var shadowRadius: CGFloat {
        
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
        
    }
    
}

extension UIView {
    func addToView(parant: UIView) {
        parant.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parant.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parant.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parant.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parant.bottomAnchor).isActive = true
    }
}

