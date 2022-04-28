//
//  MainView.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 24/04/22.
//

import SwiftUI

struct BaseView: View {
    
    var body: some View{
        GeometryReader{ geometry in
            if geometry.size.width < 1000{
                ScrollView{
                    VStack{
                        ShapesInputView()
                        Divider().background(Color.white)
                        DrawingArea()
                    }.padding(.all, 50).frame(maxWidth: .infinity, alignment: .leading)
                }.background(Color.black.opacity(0.7))
                    
            }else{
                HStack(alignment: .top, spacing: 30){
                    ShapesInputView()
                    DrawingArea()
                }.padding(.all, 20).background(Color.black.opacity(0.7))//.frame(minWidth: 1100, minHeight: 630)
            }
        }.onTapGesture {
            hideKeyboard()
        }
    }
}

struct ShapesInputView: View{
    var body: some View{
        VStack(spacing: 20){
            CustomText(text: "Draw Shapes", fontSize: 30).padding(.bottom, 30)
            LineSection()
            Divider().background(Color.white)
            CircleSection()
            Divider().background(Color.white)
            RectangleSection()
        }
    }
}
