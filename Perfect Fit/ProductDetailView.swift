import SwiftUI


/// A view for displaying the details of a specific product.
struct ProductDetailView: View {
    
    /// The view model for managing products.
    @ObservedObject var viewModel: ProductsViewModel
    
    /// The product to be displayed.
    let product: Product
    
    /// The body of the view, containing the layout and components for displaying the product details.
    var body: some View {
        VStack {
            if let imagePath = product.imagePath, let uiImage = UIImage(contentsOfFile: imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding()
            } else {
                Color.gray
                    .frame(height: 300)
                    .padding()
            }
            
            Text(product.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("Rs. " + product.price)
                .font(.title)
                .foregroundColor(.gray)
                .padding(.top, 5)
            
            ScrollView {
                Text(product.description)
                    .font(.body)
                    .padding()
            }
            
            
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.deleteProduct(product: product)
                }) {
                    Text("Delete")
                        .foregroundColor(.red)
                }
                Spacer()
                NavigationLink(destination: EditProductView(productsViewModel: viewModel, product: product)) {
                    Text("Edit")
                }
                Spacer()
            }
            .padding()
            
            Spacer()
            
//            // Debug: Display the image path on screen
//            if let imagePath = product.imagePath {
//                Text("Image Path: \(imagePath)")
//                    .font(.footnote)
//                    .foregroundColor(.red)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.center)
//                    .padding(.top, 5)
//            }

        }
        .navigationTitle(product.title)
    }
}
