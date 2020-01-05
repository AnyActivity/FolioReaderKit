//
//  SelectedTextCenter.swift
//  FolioReaderKit
//
//  Created by lei on 2020/1/5.
//  Copyright © 2020 FolioReader. All rights reserved.
//

import Foundation

public protocol SelectedTextObserver : class {
    func update(text :String?)
}

open class SelectedTextCenter {
    static let share = SelectedTextCenter()
    
    private init(){}
    
    var observers : [SelectedTextObserver] = []
    
    public var text : String?
    
    public func update(text:String?) {
        self.text = text
        self.observers.forEach { $0.update(text: text)}
    }
    
    public func add(_ observer:SelectedTextObserver) {
        self.observers.append(observer)
    }
    
    public func remove(_ aObserver:SelectedTextObserver) {
        self.observers.removeAll { $0 === aObserver
        }
    }
}

