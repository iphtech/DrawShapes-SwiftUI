//
//  HoleShape.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

struct CircleShape: View{
    @State var item: CircleModel
    @State var circleDimentions: CircleModel = CircleModel()
    
    // Grid view frame variables
    @EnvironmentObject var scaleFactor: ScaleFactor
    @State var color: Color = Color.red
    let geometry: GeometryProxy

    @State var xHolePos: Double = 0
    @State var yHolePos: Double = 0
    @State var radius: Double = 0
    
    //MARK: VIEW
    var body: some View{
        
        Circle()
            .strokeBorder(color, lineWidth: 1)
            .frame(width: CGFloat(radius*2), height: CGFloat(radius*2))
            .offset(x: CGFloat(xHolePos), y: CGFloat(yHolePos))
            .onReceive(self.scaleFactor.$vScaleValue, perform: { vScale in
                
                circleDimentions = item
                
                xHolePos = getComponentVal3(val: circleDimentions.xHolePos)
                yHolePos = getComponentVal3(val: circleDimentions.yHolePos)
                radius = getComponentVal3(val: circleDimentions.radius)
                
                radius = radius * Double(geometry.size.height)/6/(self.scaleFactor.hScaleValue - vScale)
                xHolePos = xHolePos * Double(geometry.size.width/6)/(self.scaleFactor.hScaleValue - vScale)
                yHolePos = -yHolePos
                yHolePos = yHolePos * Double(geometry.size.height/6)/(self.scaleFactor.hScaleValue - vScale)
                
                let centerXAlign = radius
                let centerYAlign = radius
                
                xHolePos = xHolePos + Double((Int(scaleFactor.mapWidth)/6)) - centerXAlign
                yHolePos = yHolePos + Double((Int(scaleFactor.mapHeight)/2)) - centerYAlign
                
            })
    }
}
