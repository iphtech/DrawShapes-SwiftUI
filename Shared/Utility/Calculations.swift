//
//  Calculations.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 25/04/22.
//

import Foundation

func getComponentVal3(val: String) -> Double {
    var dimension: Double = 0
    var operand: [Double] = []
    var operatr: [Character] = []
    var sum: Double = 0
    var index: Int = 0
    var nextIndex: Int = 0
    
    if val.count>0{
        for i in 0...(val.count-1){
            if Character(val[i]).isNumber{
                sum=sum*10+(Double(String(val[i])) ?? 0)
            }
            else{
                operand.append(sum)
                sum = 0
                operatr.append(Character(val[i]))
            }
        }
    }
    operand.append(sum)
    
    for i in val{
        if i == "."{
            index = operatr.firstIndex(of: ".") ?? 0
            nextIndex = index+1
            nextIndex = operand.indices.contains(nextIndex) ? nextIndex : 0
            var count: Int = 0
            var temp = operand[nextIndex]
            while temp>0{
                count+=1
                temp=temp/10
            }
            operand[index] = operand[index] + operand[nextIndex] / Double(pow(10, Double(count)))
            operand.remove(at: nextIndex)
            operatr.remove(at: index)
        }
    }
    
    for i in val{
        if i == "/"{
            index = operatr.firstIndex(of: "/") ?? 0
            nextIndex = index+1
            nextIndex = operand.indices.contains(nextIndex) ? nextIndex : 0
            operand[index] = operand[index]/operand[nextIndex]
            operand.remove(at: nextIndex)
            operatr.remove(at: index)
        }
        if i == "*"{
            index = operatr.firstIndex(of: "*") ?? 0
            nextIndex = index+1
            nextIndex = operand.indices.contains(nextIndex) ? nextIndex : 0
            operand[index] = operand[index]*operand[nextIndex]
            operand.remove(at: nextIndex)
            operatr.remove(at: index)
        }
    }
    
    for i in val{
        if i == "+"{
            index = operatr.firstIndex(of: "+") ?? 0
            nextIndex = index+1
            nextIndex = operand.indices.contains(nextIndex) ? nextIndex : 0
            operand[index] = operand[index]+operand[nextIndex]
            operand.remove(at: nextIndex)
            operatr.remove(at: index)
        }
        if i == "-"{
            
            index = operatr.firstIndex(of: "-") ?? 0

                nextIndex = index+1
                nextIndex = operand.indices.contains(nextIndex) ? nextIndex : 0
                operand[index] = operand[index]-operand[nextIndex]
                operand.remove(at: nextIndex)
                operatr.remove(at: index)
        }
    }
    
    dimension = operand[index]
    return dimension
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
