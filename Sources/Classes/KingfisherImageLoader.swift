//
//  KingfisherImageLoader.swift
//  PhotoSlider
//
//  Created by ChangHoon Jung on 2017. 1. 10..
//  Copyright © 2017년 nakajijapan. All rights reserved.
//

import UIKit
import SDWebImage

public class KingfisherImageLoader: ImageLoader {
    public func load(
        imageView: UIImageView?,
        fromURL url: URL?,
        progress: @escaping ImageLoader.ProgressBlock,
        completion: @escaping ImageLoader.CompletionBlock) {
            
            
            
            
            
          imageView?.sd_setImage(
            with: url,
            placeholderImage: nil,
            options: SDWebImageOptions(rawValue: 0)) { image, error, cache, imageUrl in
                if error == nil {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            
            
            
//        imageView?.kf.setImage(
//            with: url,
//            placeholder: nil,
//            options: [.transition(.fade(1))],
//            progressBlock: { (receivedSize, totalSize) in
//                progress(
//                    Int(truncatingIfNeeded: receivedSize),
//                    Int(truncatingIfNeeded: totalSize)
//                )
//        }, completionHandler: { result in
//            switch result {
//            case .success(let value):
//                let image = value.image
//                completion(image)
//            case .failure(_):
//                completion(nil)
//            }
//        })
    }
}
