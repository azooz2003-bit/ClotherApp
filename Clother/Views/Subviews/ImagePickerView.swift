//
//  PhotoCaptureView.swift
//  Clother
//
//  Created by Abdulaziz Albahar on 4/5/24.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(image: $image, isShown: $showImagePicker, sourceType: .photoLibrary)
    }
}

#Preview {
    ImagePickerView(showImagePicker: .constant(false), image: .constant(.init("")))
}
