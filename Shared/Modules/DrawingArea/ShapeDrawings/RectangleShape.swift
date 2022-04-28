//
//  RectangleShape.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

struct RectangleShape: View{
    @State var item: RectangleModel
    @State var rectDimentions: RectangleModel = RectangleModel()
    
    // Grid view frame variables
    @EnvironmentObject var scaleFactor: ScaleFactor
    @State var color: Color = Color.red
    let geometry: GeometryProxy
    
    @State var xPos: Double = 0
    @State var yPos: Double = 0
    @State var corners: Double = 0
    @State var width: Double = 0
    @State var height: Double = 0
    
    //MARK: VIEWS
    var body: some View{
        Path { path in
            path.move(to: CGPoint(x: xPos, y: yPos + corners))
            path.addLine(to: CGPoint(x: xPos, y: yPos + height - corners))
            path.addQuadCurve(to: CGPoint(x: xPos + corners, y: yPos + height), control: CGPoint(x: xPos, y: yPos + height))
            path.addLine(to: CGPoint(x: xPos + width - corners, y: yPos + height))
            path.addQuadCurve(to: CGPoint(x: xPos + width, y: yPos + height - corners), control: CGPoint(x: xPos + width, y: yPos + height))
            path.addLine(to: CGPoint(x: xPos + width, y: yPos + corners))
            path.addQuadCurve(to: CGPoint(x: xPos + width - corners, y: yPos), control: CGPoint(x: xPos + width, y: yPos))
            path.addLine(to: CGPoint(x: xPos + corners, y: yPos))
            path.addQuadCurve(to: CGPoint(x: xPos, y: yPos + corners), control: CGPoint(x: xPos, y: yPos))
            
        }.stroke(color, lineWidth: 2)
        
            .onReceive(self.scaleFactor.$vScaleValue, perform: { vScale in
                
                rectDimentions = item
                
                xPos = getComponentVal3(val: rectDimentions.xPos)
                yPos = getComponentVal3(val: rectDimentions.yPos)
                corners = getComponentVal3(val: rectDimentions.cornerRadius)
                width = getComponentVal3(val: rectDimentions.width)
                height = getComponentVal3(val: rectDimentions.height)
                
                height = height * Double(geometry.size.height)/6/(self.scaleFactor.hScaleValue - vScale)
                width = width * Double(geometry.size.width)/6/(self.scaleFactor.hScaleValue - vScale)
                corners = corners * Double(geometry.size.width)/6/(self.scaleFactor.hScaleValue - vScale)
                
                xPos = xPos * Double(geometry.size.width/6)/(self.scaleFactor.hScaleValue - vScale)
                yPos = -yPos
                yPos = yPos * Double(geometry.size.height/6)/(self.scaleFactor.hScaleValue - vScale) // for scaling any parameter
                let centerXAlign = width/2
                let centerYAlign = height/2
                
                xPos = xPos + Double((Int(scaleFactor.mapWidth)/6)) - centerXAlign
                yPos = yPos + Double((Int(scaleFactor.mapHeight)/2)) - centerYAlign
                
                if width == height{
                    if corners >= width/2{
                        corners = width/2
                    }
                } else if width > height{
                    if corners >= height/2{
                        corners = height/2
                    }
                } else {
                    if corners >= width/2{
                        corners = width/2
                    }
                }
                
            })
    }
}
