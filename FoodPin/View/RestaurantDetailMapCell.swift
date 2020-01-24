//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by shuo on 2019/12/16.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import MapKit


class RestaurantDetailMapCell: UITableViewCell {

    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        //取得位置
        let geoCoder = CLGeocoder()
        
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            
            if let placemarks = placemarks {
                //取得第一個地點標記
                let placemark = placemarks[0]
                
                
                //加入標記
                let annotation = MKPointAnnotation()
                
                
                if let location = placemark.location {
                    //顯示標記
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    
                    //設定縮放程度
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
                
            }
            
        })
        
        
    }
    

}
