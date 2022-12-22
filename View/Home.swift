//
//  Home.swift
//  CanvasEditor
//
//  Created by Jacek Kosinski U on 22/12/2022.
//

import SwiftUI

struct Home: View {
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            //MARK: Canvas View
            //Later
            
            //MARK: Canvas Actions
            HStack(spacing: 15){
                Button{
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                }
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "photo.on.rectangle")
                        .font(.title3)
                }
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxHeight: .infinity,alignment: .top)
            
            //MARK: SAVE Button
            Button{
                
            } label: {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottomTrailing)
        }
        .preferredColorScheme(.dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
