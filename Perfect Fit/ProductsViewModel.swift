//
//  ProductsViewModel.swift
//  Perfect Fit
//
//  Created by Mohamed Amhar on 7/28/24.
//

import Combine
import Foundation

/// A struct representing a product.
struct Product: Identifiable {
    var id = UUID()
    let imagePath: String?
    let title: String
    let price: String
    let description: String
    
    /// Initializes a new product.
    /// - Parameters:
    ///   - id: The unique identifier of the product.
    ///   - imagePath: The file path of the image associated with the product.
    ///   - title: The title of the product.
    ///   - price: The price range of the product.
    ///   - description: A detailed description of the product.
    init(id: UUID = UUID(), imagePath: String?, title: String, price: String, description: String) {
        self.id = id
        self.imagePath = imagePath
        self.title = title
        self.price = price
        self.description = description
    }
}

/// The array of products available in the view model.
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(imagePath: "IMG_3696", title: "Body Butter", price: "3000-2800", description: "Indulge in the luxury of our body butter. Experience intense hydration and silky-smooth skin. Nourish and revitalize with our blissful blend of shea butter, cocoa butter, and coconut oil. Pamper yourself and embrace radiant beauty. Try our body butter today."),
        
        Product(imagePath: "IMG_3697", title: "Deodorant", price: "3000-2800", description: "Refresh Formula\n\n"+"Stay fresh and confident all day with our natural deodorant. Experience the invigorating blend of coconut oil, sunflower oil, beeswax, arrowroot powder, bentonite clay, kaolin clay, calamine clay, and a refreshing mix of strawberry, peppermint, and lime essential oils. No aluminium, phthalates, or parabens. Embrace the power of nature and stay naturally refreshed."+"\n\n\nEarthy Rhythm Formula\n\n"+"Embrace the soothing power of nature with our natural deodorant. Enriched with coconut oil, sunflower oil, beeswax, arrowroot powder, bentonite clay, kaolin clay, calamine clay, and a harmonious blend of frankincense and lavender essential oils. Enjoy a balanced and serene rhythm while staying protected. No aluminium, phthalates, or parabens. Experience the gentle care of nature."),
        
        Product(imagePath: "IMG_3698", title: "Lip Balm", price: "3000-2800", description: "Revitalize your lips with our Luscious Citrus Lip Balm, featuring Candelilla wax for a protective barrier and virgin olive oil for deep hydration. Infused with lemon oil and orange essential oil, this balm provides a refreshing citrus aroma and is rich in vitamin C and antioxidants to combat environmental stressors.\n\nWith vitamin E oil and Pinda oil, your lips will feel soft and rejuvenated, while zinc oxide offers natural UV protection. Enjoy a hint of shimmer from natural mica colors, and experience luscious, healthy lips every day!"),
        
        Product(imagePath: "IMG_3699", title: "Lip Butter", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3700", title: "Body Gel", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3701", title: "Virgin Oils", price: "1500,1000", description: "Description"),
        
        Product(imagePath: "IMG_3702", title: "Herbal Shampoo", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3703", title: "Hair Conditioner", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3704", title: "Sun Repair Oil", price: "3000-Rs.2800", description: "Description"),
        
        Product(imagePath: "IMG_3705", title: "Anti-Wrinkle/Anti-Aging", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3706", title: "Face Scrub", price: "2000-1800", description: "Description"),
        
        Product(imagePath: "IMG_3707", title: "Face Mask", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3708", title: "Face Cream", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3709", title: "PimpleOut Cream", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3711", title: "Zinc", price: "3000-2800(small)\nRs. 5800-5500(big)", description: "Description"),
        
        Product(imagePath: "IMG_3712", title: "Zinc Stick", price: "3200-3000", description: "Description"),
        
        Product(imagePath: "IMG_3713", title: "Essential Oil", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3714", title: "PainKiller Spray", price: "2000-1800", description: "Description"),
        
        Product(imagePath: "IMG_3715", title: "PainKiller Roll On", price: "1000-800", description: "Description"),
        
        Product(imagePath: "IMG_3716", title: "Sun Repair Oil", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3718", title: "Sandlewood Serem", price: "3000-2800(small)\nRs. 3500-3300", description: "Description"),
        
        Product(imagePath: "IMG_3719", title: "Beard Oil", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3721", title: "Wound Healer Oil", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3723", title: "Natural Oil", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3725", title: "FaceWash", price: "3000-2800", description: "Description"),
        
        Product(imagePath: "IMG_3726", title: "Body Lotion", price: "3000-2800(small)\nRs. 4000-3800", description: "Description"),
        
        Product(imagePath: "IMG_3727", title: "Massage Oil", price: "3000-2800(small)\nRs. 4000-3800", description: "Description"),
        
        Product(imagePath: "IMG_3728", title: "Perfume Oil", price: "2500-2200", description: "Description"),
        
        Product(imagePath: "IMG_3729", title: "Shower Gel", price: "4000-3800", description: "Description"),
        
        Product(imagePath: "IMG_3730", title: "Herbal Shampoo", price: "4000-3800", description: "Description"),
        
        Product(imagePath: "IMG_3731", title: "Citronella Spray", price: "2200-2000", description: "Description"),
    ]
    
    
    /// The search text used to filter products.
    @Published var searchText: String = ""
        
    /// Function to add a new product to the array
    /// - Parameters:
    ///   - title: The title of the product.
    ///   - price: The price range of the product.
    ///   - description: A detailed description of the product.
    ///   - imagePath: The file path of the image associated with the product.
    func addProduct(title: String, price: String, description: String, imagePath: String?) {
        let newProduct = Product(imagePath: imagePath, title: title, price: price, description: description)
        products.append(newProduct)
    }
    
    /// Deletes a product from the array of products.
    /// - Parameter product: The product to be deleted.
    func deleteProduct(product: Product) {
        products.removeAll { $0.id == product.id }
    }
    
    /// Filters the products based on the search text.
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.description.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
