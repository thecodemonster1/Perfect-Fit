//
//  AddProcuctView.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 7/31/24.
//

import SwiftUI
import UIKit

/// A view for adding a new product to the app.
struct AddProductView: View {
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var description: String = ""
    @State private var selectedImagePath: String? // Updated to store the image path
    @State private var isImagePickerPresented: Bool = false

    @ObservedObject var productsViewModel: ProductsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product Details")) {
                    TextField("Title", text: $title)
                    TextField("Price", text: $price)
                    TextField("Description", text: $description)
                    
                    Button(action: {
                        self.isImagePickerPresented.toggle()
                    }) {
                        Text("Select Image")
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImagePath: self.$selectedImagePath)
                    }
                    
                    // Display the selected image
                    if let imagePath = selectedImagePath, let uiImage = UIImage(contentsOfFile: imagePath) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                }

                Button(action: {
                    if let selectedImagePath = selectedImagePath {
                        // Call the function to add the product to the array
                        productsViewModel.addProduct(title: title, price: price, description: description, imagePath: selectedImagePath)
                        // Dismiss the view
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        print("No image selected.")
                    }
                }) {
                    Text("Save Product")
                }
            }
            .navigationTitle("Add Product")
        }
    }
}
