//
//  ContentView.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 7/18/24.
//

import SwiftUI

/// The main content view for the Perfect Fit app.
struct ContentView: View {
    /// The view model that manages the list of products.
    @StateObject private var viewModel = ProductsViewModel()
    
    /// Focus state for the search field.
    @FocusState private var isSearchFieldFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // App title
                    Text("Perfect Fit")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.H_1)
                        .multilineTextAlignment(.center)

                    // Navigation link to add a new product
                    NavigationLink(destination: AddProductView(productsViewModel: viewModel)) {
                        Text("Add New Product")
                    }
                    .navigationTitle("Products")

                    // Grid of product cards
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(viewModel.filteredProducts) { product in
                            // Navigation link to product detail view
                            NavigationLink(destination: ProductDetailView(viewModel: viewModel, product: product)) {
                                productCard(product.imagePath ?? "", product.title, product.price)
                            }
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.hidden, axes: [.vertical, .horizontal])
                .searchable(text: $viewModel.searchText, prompt: "Search products")
                .focused($isSearchFieldFocused)
            }
        }
    }

    /// Creates a view for a product card.
    /// - Parameters:
    ///   - productImg: The image path of the product.
    ///   - productTitle: The title of the product.
    ///   - productPrice: The price of the product.
    /// - Returns: A view displaying the product image, title, and price.
    func productCard(_ imagePath: String, _ productTitle: String, _ productPrice: String) -> some View {
        VStack {
            if let uiImage = UIImage(contentsOfFile: imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 150)
                    .cornerRadius(20)
                    .padding()
            } else {
                // Placeholder for missing image
                Color.gray
                    .frame(width: 140, height: 150)
                    .cornerRadius(20)
                    .padding()
            }

            Text(productTitle)
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color.black)

            Text("Rs. " + productPrice)
                .foregroundColor(Color.black)
                .padding(.bottom, 10)
//            // Debug: Display the image path on screen
//            Text("Image Path: \(imagePath)")
//                .font(.footnote)
//                .foregroundColor(.red)
//                .lineLimit(2)
//                .multilineTextAlignment(.center)
//                .padding(.top, 5)
        }
        .background(Color.cardColorBG1)
        .cornerRadius(20)
        .shadow(radius: 10)
        
    }
}

#Preview {
    ContentView()
}
