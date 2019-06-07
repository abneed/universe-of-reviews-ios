//
//  Extensions.swift
//  universe-of-reviews-ios
//
//  Created by Guillermo Abneed Rodriguez Velazquez on 6/7/19.
//  Copyright © 2019 Guillermo Abneed Rodriguez Velazquez. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    func createString() -> String
    {
        let imageData  = self.jpegData(compressionQuality: CGFloat(2.0)) //Esto comvierte la imagen que esta en binario en cadena.
        let imageString = imageData?.base64EncodedString()
        
        return imageString!
    }
    
}

extension String //Creamos un método de la clase String.
{
    func createImage() -> UIImage //Cada String puede usar este método.
    {
        //Crear un binario de la clase data que vendra de codificar la cadena
        let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters)
        
        //Si la imagenData no reslta en nada o viene vacia.
        if(imageData == nil) || (self == "")
        {
            return UIImage() //regresame una imagen vacia
        }
        else
        {
            guard let img = UIImage(data: imageData!) else { return UIImage() } //Conviertelo a imagen
            return img //Regresame la imagen.
        }
    }
}
