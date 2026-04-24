//
//  KingfisherImageLoader.swift
//  PhotoSlider
//
//  Created by ChangHoon Jung on 2017. 1. 10..
//  Copyright © 2017년 nakajijapan. All rights reserved.
//

import UIKit

public class KingfisherImageLoader: ImageLoader {

    private var task: URLSessionDataTask?

    public init() {}

    public func load(
        imageView: UIImageView?,
        fromURL url: URL?,
        progress: @escaping ImageLoader.ProgressBlock,
        completion: @escaping ImageLoader.CompletionBlock
    ) {

        guard let imageView = imageView, let url = url else {
            completion(nil)
            return
        }

        // Cancel any existing task
        task?.cancel()

        let request = URLRequest(url: url)
        task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data, error == nil, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            DispatchQueue.main.async {
                imageView.image = image
                completion(image)
            }
        }

        task?.resume()
    }
}
