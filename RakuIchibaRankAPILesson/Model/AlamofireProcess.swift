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
                
                let detailData = JSON(response.data as Any)
                privateItemDetailArray = []
                                
                for dataCount in 0...detailData["Rankings"][0]["Ranking"]["hotels"].count - 1{
                    
                    if let getRank = detailData["Rankings"][0]["Ranking"]["hotels"][dataCount]["hotel"]["rank"].int,
                       let getHotelImageUrl = detailData["Rankings"][0]["Ranking"]["hotels"][dataCount]["hotel"]["hotelImageUrl"].string,
                       let getHotelName = detailData["Rankings"][0]["Ranking"]["hotels"][dataCount]["hotel"]["hotelName"].string,
                       let getMiddleClassName = detailData["Rankings"][0]["Ranking"]["hotels"][dataCount]["hotel"]["middleClassName"].string{
                        
                        
                        privateItemDetailArray.append(HotelDetailDatas(rank:getRank,
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


