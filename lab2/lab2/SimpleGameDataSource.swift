//
//  SimpleGameDataSource.swift
//  lab2_1
//
//  Created by Student on 19/02/2020.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation


class SimpleGameDataSource:GameDataSource{
    var size:Int!
    var field:Field!
    
    init(size:Int){
        field = Field(size: size)
        self.size = size
    }
    
    func getField() -> Field {
        return field
    }
}
