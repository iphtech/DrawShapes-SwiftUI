//
//  GraphView.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

//MARK: GRAPH LINES
struct GraphLines: View{
    @State var number: Int
    @State var geometry: GeometryProxy
    @EnvironmentObject var scaleFactor: ScaleFactor

    var body: some View{
        
        //Vertical lines
        Path { path in
            path.move(to: CGPoint(x: (Int(geometry.size.width)/6 * number), y: 0))
            path.addLine(to: CGPoint(x: CGFloat(Int(geometry.size.width)/6 * number), y: geometry.size.height))
            
        }.stroke(number == 1 ? Color.black : Color.gray, lineWidth: number == 0 ? 2 : 0.5)
        
        //Horizontal lines
        Path { path in
            path.move(to: CGPoint(x: 0, y: CGFloat(Int(geometry.size.height)/6 * number)))
            path.addLine(to: CGPoint(x: geometry.size.width, y: CGFloat(Int(geometry.size.height)/6 * number)))
        }.stroke(number == 3 ? Color.black : Color.gray, lineWidth: number == 0 ? 2 : 0.5)
        
        
    }
}

//MARK: GRAPH AXIS TEXT
struct AxisText: View{
    @EnvironmentObject var scaleFactor: ScaleFactor
    @State var number: Int
    @State var geometry: GeometryProxy
    
    var body: some View{
        
        //Horizontal Axis Text
        if number == 3 {
            CustomText(text: "0", fontSize: 7, color: .gray)
                .offset(y: CGFloat(geometry.size.height/6) * CGFloat(number) - 10 )
        }
        else if number < 3 {
            CustomText(text: number == 1 ? String(format: "%.2f", (scaleFactor.hScaleValue - scaleFactor.vScaleValue) * 2) : String(format: "%.2f", (scaleFactor.hScaleValue - scaleFactor.vScaleValue)), fontSize: 7, color: .gray)
                .offset(y: CGFloat(geometry.size.height/6) * CGFloat(number) - 10 )
            
        } else {
            CustomText(text: number == 4 ? String(format: "%.2f", -(scaleFactor.hScaleValue - scaleFactor.vScaleValue)) : String(format: "%.2f", -(scaleFactor.hScaleValue - scaleFactor.vScaleValue) * 2), fontSize: 7, color: .gray)
                .offset(y: CGFloat(geometry.size.height/6) * CGFloat(number) - 10 )
        }
         
        //Vertical Axis Text
        CustomText(text: String(format: "%.2f", (scaleFactor.hScaleValue - scaleFactor.vScaleValue) * Double(number-1)), fontSize: 7, color: .gray)
            .offset(x: CGFloat(geometry.size.width/6) * CGFloat(number) + 5, y: geometry.size.height - 10 )
    }
}
