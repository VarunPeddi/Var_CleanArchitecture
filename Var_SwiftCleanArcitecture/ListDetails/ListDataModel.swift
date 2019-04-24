//
//  ListDataModel.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

struct ListDataModel {
    
    var optionsDetails:String?
    
    static func parsingResponseFromServer(_ response:Any) -> [ListDataModel] {
        var listArrModel = [ListDataModel]()
        if let responseDict = response as? [String:Any] {
            let responseQuiz = responseDict["quiz"] as? [String:Any]
            let responseMaths = responseQuiz?["maths"] as? [String:Any]
            let responseqi = responseMaths?["q1"] as? [String:Any]
            let resArr = responseqi?["options"] as? [String]
            
            for subArr in resArr ?? [] {
                var model = ListDataModel()
                model.optionsDetails = subArr
              listArrModel.append(model)
            }
        }
        return listArrModel
    }
}
