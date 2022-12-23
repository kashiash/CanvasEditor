//
//  Canvas.swift
//  CanvasEditor
//
//  Created by Jacek Kosinski U on 22/12/2022.
//

import SwiftUI

struct Canvas: View {
    var height: CGFloat = 260
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ZStack{
                Color.white
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
