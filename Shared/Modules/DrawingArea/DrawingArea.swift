//
//  DrawingArea.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 21/04/22.
//

import SwiftUI

struct DrawingArea: View{
    
    //MARK: ENVIRONMENT VARIABLES
    @EnvironmentObject var scaleFactor: ScaleFactor
    @EnvironmentObject var circleViewModel: CircleViewModel
    @EnvironmentObject var rectangleViewModel: RectangleViewModel
    @EnvironmentObject var lineViewModel: LineViewModel
    
    //MARK: VIEW
    var body: some View{
        HStack{
            Spacer()
            VStack{
                CustomText(text: "Drawing Area", fontSize: 30)
                
                //Scale Control Slider
                
                HStack{
                    Slider(value: Binding(get: {
                        scaleFactor.vScaleValue
                    }, set: { (newVal) in
                        scaleFactor.vScaleValueChanged(scale: newVal)
                    }), in: 0...732)
                    
                    CustomIconButton(imageName: "arrow.counterclockwise").onTapGesture {
                        scaleFactor.resetScale()
                    }
                }.padding(.horizontal, 50)
                
                //Graph Section
                Spacer()
                
                VStack{
                    ZStack{
                        GeometryReader { geometry in
                            ForEach(1..<6){ number in
                                AxisText(number: number, geometry: geometry)
                                GraphLines(number: number, geometry: geometry)
                            }
                            ForEach(circleViewModel.circlesList, id: \.self){ item in
                                CircleShape(item: item, geometry: geometry)
                            }
                            ForEach(rectangleViewModel.rectList, id: \.self){ item in
                                RectangleShape(item: item, geometry: geometry)
                            }
                            ForEach(lineViewModel.linesList, id: \.self){ item in
                                LineShape(item: item, geometry: geometry)
                            }
                        } //Geometry Reader
                    }.frame(width: scaleFactor.mapWidth, height: scaleFactor.mapHeight, alignment: .center)
                        .clipped()
                }.frame(width: scaleFactor.mapWidth, height: scaleFactor.mapHeight, alignment: .center)
                    .background(Color.white)
                
                Spacer()
            }
            Spacer()
        }
    }
}
