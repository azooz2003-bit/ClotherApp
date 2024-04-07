//
//  CameraView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/5/24.
//

import SwiftUI

struct CameraView: View {
    @Binding var showCamera: Bool
    @Binding var image: UIImage?
    
    var body: some View {
        ImagePicker(image: $image, isShown: $showCamera, sourceType: .camera)
    }
}

#Preview {
    CameraView(showCamera: .constant(true), image: .constant(nil))
}
