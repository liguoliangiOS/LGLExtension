//
//  LGLCompatible.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

public protocol LGLCompatible {}


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
