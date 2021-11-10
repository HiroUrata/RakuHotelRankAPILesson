//
//  AlamofireProcess.swift
//  RakuIchibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/10.
//

import Alamofire
import SwiftyJSON

class AlamofireProcess{
    
    private var privateItemDetailArray = [HotelDetailDatas]()
}

extension AlamofireProcess{
    
    public func getItemDetailDatas(targetGenre:String?,completion: @escaping ([HotelDetailDatas]?,Error?) -> Void){
     
        guard let genre = targetGenre else { return }

        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.result as Any)
                print(detailData)
                privateItemDetailArray = []
                
                for dataCount in 0..<detailData["Rankings"].count{
                    
                    if let getRank = detailData["Rankings"][dataCount]["Ranking"]["rank"].string,
                       let getHotelImageUrl = detailData["Rankings"][dataCount]["Ranking"]["hotelImageUrl"].string,
                       let getHotelName = detailData["Rankings"][dataCount]["Ranking"]["hotelName"].string,
                       let getMiddleClassName = detailData["Rankings"][dataCount]["Ranking"]["middleClassName"].string{
                        
                        privateItemDetailArray.append(HotelDetailDatas(rank: getRank,
                                                                      hotelImageUrl: getHotelImageUrl,
                                                                      hotelName: getHotelName,
                                                                      middleClassName: getMiddleClassName))
                    }
                
                }
                completion(privateItemDetailArray, nil)
                
            case .failure(let error):
                
                completion(nil, error)
            }
        }
        
    }
}


