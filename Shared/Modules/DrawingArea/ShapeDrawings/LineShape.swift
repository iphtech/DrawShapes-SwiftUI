//
//  LineShape.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 25/04/22.
//

import SwiftUI

struct LineShape: View{
    @State var item: LineModel
    @State var lineDimentions: LineModel = LineModel()
    
    // Grid view frame variables
    @EnvironmentObject var scaleFactor: ScaleFactor
    @State var color: Color = Color.red
    let geometry: GeometryProxy

    @State var startXPos: Double = 0
    @State var startYPos: Double = 0
    @State var endXPos: Double = 0
    @State var endYPos: Double = 0
    
    //MARK: VIEW
    var body: some View{
        
        Path { path in
            path.move(to: CGPoint(x: startXPos, y: startYPos))
            path.addLine(to: CGPoint(x: endXPos, y: endYPos))
        }.stroke(color, lineWidth: 2)
            .onReceive(self.scaleFactor.$vScaleValue, perform: { vScale in
                
                lineDimentions = item
                
                startXPos = getComponentVal3(val: lineDimentions.startXPos)
                startYPos = getComponentVal3(val: lineDimentions.startYPos)
                endXPos = getComponentVal3(val: lineDimentions.endXPos)
                endYPos = getComponentVal3(val: lineDimentions.endYPos)
                
                startXPos = startXPos * Double(geometry.size.width)/6/(self.scaleFactor.hScaleValue - vScale)
                startYPos = -startYPos
                startYPos = startYPos * Double(geometry.size.height/6)/(self.scaleFactor.hScaleValue - vScale)
               
                endXPos = endXPos * Double(geometry.size.width/6)/(self.scaleFactor.hScaleValue - vScale)
                endYPos = -endYPos * Double(geometry.size.height/6)/(self.scaleFactor.hScaleValue - vScale)
                
                startXPos = startXPos + Double((Int(scaleFactor.mapWidth)/6))
                startYPos = startYPos + Double((Int(scaleFactor.mapWidth)/2))
                endXPos = endXPos + Double((Int(scaleFactor.mapWidth)/6))
                endYPos = endYPos + Double((Int(scaleFactor.mapWidth)/2))
                
            })
    }
}

