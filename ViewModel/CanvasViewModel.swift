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
    
    //MARK: Image picker Properties
    
    @Published var showImagePicer: Bool = false
    @Published  var imageData: Data = .init(count: 0)
    
    //MARK: Error properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    //MARK: Adding Image to Stack
    func addImageToStack(image: UIImage){
        //MARK: creating SwiftUi Image View and append it to stack
        let imageView = Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        
        stack.append(StackItem(view:AnyView(imageView)))
    }
}

