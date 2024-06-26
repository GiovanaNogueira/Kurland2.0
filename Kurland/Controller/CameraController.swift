//
//  CameraController.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
                print("Imagem capturada")
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraDevice = .front // Define a câmera frontal
        picker.showsCameraControls = dao.showCameraControll
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraView>) {
        // Pode ser necessário implementar isso, dependendo dos requisitos do seu aplicativo
    }
}

func imageToString(_ image: UIImage?) -> String? {
    guard let imageData = image?.jpegData(compressionQuality: 0.8) else { return nil }
    return imageData.base64EncodedString()
}


func stringToImage(_ base64String: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: base64String) else { return nil }
    return UIImage(data: imageData)
}

