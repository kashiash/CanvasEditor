//
//  Canvas.swift
//  CanvasEditor
//
//  Created by Jacek Kosinski U on 22/12/2022.
//

import SwiftUI

struct Canvas: View {
    var height: CGFloat = 260
    @EnvironmentObject var canvasModel: CanvasViewModel
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ZStack{
                Color.white
                
                ForEach($canvasModel.stack) { $stackItem in
                    
                 
                    CanvasSubView(stackItem: $stackItem) {
                        stackItem.view
                    }
                }
            }
            .frame(width: size.width, height: size.height)
        }
        //MARK:Your desired height
        .frame(height: height)
    }
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct CanvasSubView <Content: View> : View {
    var content: Content
    @Binding var stackItem: StackItem
    
    init(stackItem: Binding<StackItem>,@ViewBuilder content: @escaping ()-> Content){
        self.content = content()
        self._stackItem = stackItem
        
        
    }
    
    var body: some View {
        content
    }
}
