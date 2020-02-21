//
//  Field.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

enum TypeCell:String, CaseIterable{
    case Next = "Вперед"
    case Back = "Назад "
    static func random() -> TypeCell {
        switch Int.random(in: 1...2) {
        case 1: return TypeCell.Next
        default: return TypeCell.Back
        }
    }
}

class Field{
    let cells:Array<TypeCell>
    init?(size:Int) {
        if (size < 1){
            return nil
        }
        var cells = Array<TypeCell>()
        cells.append(TypeCell.Next)
        for _ in 2...size {
            cells.append(TypeCell.random())
        }
        self.cells = cells
    }
}
