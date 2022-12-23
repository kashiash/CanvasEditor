//
//  StackItem.swift
//  CanvasEditor
//
//  Created by Jacek Kosinski U on 22/12/2022.
//

import SwiftUI

struct StackItem: Identifiable {
    var id = UUID().uuidString
    var view: AnyView
}


