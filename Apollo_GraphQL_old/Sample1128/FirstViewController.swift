//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import Apollo
import StarWarsAPI

class FirstViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    getData()
  }
  
  func getData() {
    let apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
    let query = Query()
    apollo.fetch(query: query) { result in
      switch result {
      case .success(let graphQLResult):
        print("Success! Result: \(graphQLResult)")
      case .failure(let error):
        print("Failure! Error: \(error)")
      }
    }
  }
}


