//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    
    private var allProducts: [Product] = []
    
    private var cancellables: Set<AnyCancellable> = []
    private let repository = ProductRepository()
    
    init() {
        getProducts()
        
        // Search text binding
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.filterProducts(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    func getProducts() {
        repository.getProducts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { products in
                self.products = products
                self.allProducts = products
                print(products)
            }
            .store(in: &cancellables)
    }
    
    func saveProduct(_ product: Product) {
        repository.createOrUpdateProduct(product)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in
                print("Product saved successfully")
                self.getProducts()
            }
            .store(in: &cancellables)
        
    }
    
    private func filterProducts(searchText: String) {
        if searchText.isEmpty {
            products = allProducts
        } else {
            products = allProducts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            print(products)
        }
    }
    
}
