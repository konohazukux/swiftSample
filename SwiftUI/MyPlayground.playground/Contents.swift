import UIKit

var greeting = "Hello, playground"



//let dateString = "2023-09-14T00:00:00Z999"
let dateString = "2023-09-14T00:00:00"

let iso8601Formatter: ISO8601DateFormatter = {
  let formatter = ISO8601DateFormatter()
  formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
  return formatter
}()


let date = iso8601Formatter.date(from: dateString)
print(date)










