//
//  PhotosCollection.swift
//  Navigation
//
//  Created by Юлия Филимонова on 30.04.2022.
//

import UIKit

struct PhotoGallery {
    
    let photo: UIImage
    
    static func makeCell() -> [PhotoGallery] {
        var photoGallery = [PhotoGallery]()
        photoGallery.append(PhotoGallery(photo: UIImage(named: "jey")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "jm")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "rp")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "fm")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "sb")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "fr")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "sb1")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "sb2")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "fr1")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "cat")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "dog")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "fr2")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "dog1")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "dog2")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "louvre")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "fontan")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "dark")!))
        photoGallery.append(PhotoGallery(photo: UIImage(named: "je")!))
        return photoGallery
    }
    
}
