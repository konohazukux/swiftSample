//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    private var cancellables: Set<AnyCancellable> = []
    private let repository = ProductRepository()

    init() {
        getProducts()
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
            }
            .store(in: &cancellables)
    }
}
