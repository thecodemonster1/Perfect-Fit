//
//  EditProcuctView.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 7/31/24.
//

import Foundation
import SwiftUI
import UIKit

/// A view for editing an existing product in the app.
struct EditProductView: View {
    
    @State private var title: String
    @State private var price: String
    @State private var description: String
    @State private var selectedImagePath: String?
    @State private var isImagePickerPresented: Bool = false
    
    @ObservedObject var productsViewModel: ProductsViewModel
    @Environment(\.presentationMode) var presentationMode
    let product: Product
    
    /// Initializes the view with the provided productsViewModel and product.
    /// - Parameters:
    ///   - productsViewModel: The view model for managing products.
    ///   - product: The product to be edited.
    init(productsViewModel: ProductsViewModel, product: Product) {
        self.productsViewModel = productsViewModel
        self.product = product
        _title = State(initialValue: product.title)
        _price = State(initialValue: product.price)
        _description = State(initialValue: product.description)
        _selectedImagePath = State(initialValue: product.imagePath)
    }
    
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
                    
                    // Display the selected image or existing product image
                    if let imagePath = selectedImagePath, let uiImage = UIImage(contentsOfFile: imagePath) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                }
                
                Button(action: {
                    if let index = productsViewModel.products.firstIndex(where: { $0.id == product.id }) {
                        productsViewModel.products[index] = Product(
                            id: product.id,
                            imagePath: selectedImagePath,
                            title: title,
                            price: price,
                            description: description
                        )
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Save Changes")
                }
            }
            .navigationTitle("Edit Product")
        }
    }
}
