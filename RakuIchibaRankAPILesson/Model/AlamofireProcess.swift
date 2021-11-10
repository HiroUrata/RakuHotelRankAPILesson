//
//  AlamofireProcess.swift
//  RakuIchibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/10.
//

import Alamofire
import SwiftyJSON

class AlamofireProcess{
    
    private var privateItemDetailArray = [ItemDetailDatas]()
}

extension AlamofireProcess{
    
    public func getItemDetailDatas(targetAge:String?,targetGender:String?,completion: @escaping ([ItemDetailDatas]?,Error?) -> Void){
     
        guard let age = targetAge else { return }
        guard let gender = targetGender else { return }
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.result as Any)["Items"]
                
                for dataCount in 0..<detailData.count{
                    
                    if let getRank = detailData[dataCount]["Item"]["rank"].string,
                       let getMediumImageUrls = detailData[dataCount]["Item"]["mediumImageUrls"]["imageUrl"].string,
                       let getItemName = detailData[dataCount]["Item"]["itemName"].string,
                       let getItemPrice = detailData[dataCount]["Item"]["itemPrice"].string{
                        
                        privateItemDetailArray.append(ItemDetailDatas(rank: getRank,
                                                                      mediumImageUrls: getMediumImageUrls,
                                                                      itemName: getItemName,
                                                                      itemPrice: getItemPrice))
                    }
                
                }
                completion(privateItemDetailArray, nil)
                
            case .failure(let error):
                
                completion(nil, error)
            }
        }
        
    }
}

