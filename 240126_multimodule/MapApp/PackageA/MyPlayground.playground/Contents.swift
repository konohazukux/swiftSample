import UIKit

let temp1 = [1, 4, 6]
let temp2 = [1, 2, 3, 4, 5, 6]

let temp3a = temp1.contains(temp2)
let temp3b = temp2.contains(temp1)

let temp4a = temp2.contains(1)
let temp4b = temp2.contains([1, 3])
let temp4c = temp2.contains(7)

// temp1の要素が含まれているか確認するなら
let temp6a = temp1.allSatisfy(temp2.contains)

// temp6a は省略されていますが、下記と同義です
let temp6b = temp1.allSatisfy({temp2.contains($0)})



