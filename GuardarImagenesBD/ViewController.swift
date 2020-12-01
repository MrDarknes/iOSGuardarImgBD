//
//  ViewController.swift
//  GuardarImagenesBD
//
//  Created by Mac16 on 08/11/20.
//  Copyright © 2020 oscar. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var guardarImgView: UIImageView!
    @IBOutlet weak var verImagenView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func guardarImagen(_ sender: Any) {
        if let imageData = guardarImgView.image?.pngData(){
            DBManager.shareInstance.saveImage(data: imageData)
        }
    }
    @IBAction func verImagen(_ sender: Any) {
        let arr = DBManager.shareInstance.fetchImage()
        print(arr.count)
        verImagenView.image = UIImage(data: arr[2].imgBinary!)
        
    }
    @IBAction func añadirImagen(_ sender: UIBarButtonItem) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //MOSTRAR LA IMAGEN SELECCIONADA
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        guardarImgView.image = userPickedImage
        picker.dismiss(animated: true)
    }
}



