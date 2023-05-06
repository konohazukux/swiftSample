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

    func createOrUpdateProduct() {
        let product = Product(name: "name3", code: "code3")
        repository.createOrUpdateProduct(product)
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
}
