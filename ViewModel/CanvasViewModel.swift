//
//  CanvasViewModel.swift
//  CanvasEditor
//
//  Created by Jacek Kosinski U on 22/12/2022.
//

import SwiftUI

class CanvasViewModel: ObservableObject {
  //MARK: Canvas Stack
    @Published var stack: [StackItem] = []
    
    //MARK: Image poicker Properties
    
    @Published var showImagePicer: Bool = false
    @Published  var imageData: Data = .init(count: 0)
    
    //MARK: Error properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
}

