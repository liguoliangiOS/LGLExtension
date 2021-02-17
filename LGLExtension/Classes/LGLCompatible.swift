//
//  LGLCompatible.swift
//  Swift学习
//
//  Created by Passer on 2021/2/16.
//

import UIKit

public protocol LGLCompatible {}

///注意：写上get是为了将来可以扩充mutating，让编译器编译通过
public extension LGLCompatible {
    var lgl:LGL<Self> {
        set {}
        get { LGL(self) }
    }
    
    static var lgl:LGL<Self>.Type {
        set {}
        get {
            LGL<Self>.self
        }
    }
}
