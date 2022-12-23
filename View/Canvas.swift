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
        .clipped()
        
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
    
    @State var hapticScale: CGFloat = 1
    var body: some View {
        content
            .rotationEffect(stackItem.rotation)
        //safe scaling
            .scaleEffect(stackItem.scale < 0.4 ? 0.4 : stackItem.scale)
            .scaleEffect(hapticScale)
            .offset(stackItem.offset)
            .onLongPressGesture(minimumDuration: 0.3) {
                UIImpactFeedbackGenerator(style: .medium)
                    .impactOccurred()
                    withAnimation(.easeInOut) {
                        hapticScale = 1.2
                    }
                withAnimation(.easeInOut.delay(0.1)) {
                    hapticScale = 1
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        stackItem.offset = CGSize(width: stackItem.lastOffset.width +
                                                  value.translation.width, height: stackItem.lastOffset.height +
                                                  value.translation.height)
                    }).onEnded({value in
                        stackItem.lastOffset = stackItem.offset
                        
                    })
            )
            .gesture(
                MagnificationGesture()
                    .onChanged({value in
                        
                        //MARK: It start with Existing scaling = 1
                        stackItem.scale = stackItem.lastScale + (value - 1)
                    }).onEnded({ value in
                        stackItem.lastScale = stackItem.scale
                    })
                //MARK: Simultanously
                    .simultaneously(with:
                                        RotationGesture()
                        .onChanged({ value in
                            stackItem.rotation = stackItem.lastRotation + value
                        }).onEnded({ value in
                            stackItem.lastRotation = stackItem.rotation
                            
                        })
                 )
            )
    }
}
