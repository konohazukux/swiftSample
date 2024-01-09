//
//  Club.swift
//  CleanArchitectureSample
//
import Foundation

class Club: Identifiable, Codable {
  var clubId: ClubId
  var name: String
  var clubStatus: ClubStatus
  var createdAt: Date
  private var studentIds: [StudentId]
  
  private static let minimumApproveStudentNumber = 5
  
  init(name: String) {
    self.clubId = ClubId() // Assuming ClubId has an initializer
    self.name = name
    self.clubStatus = .notApproved
    self.studentIds = []
    self.createdAt = Date()
  }
  
  // Adds a student to the club
  func addStudent(_ studentId: StudentId) throws {
    if studentIds.contains(studentId) {
      throw DomainException("Student already registered")
    }
    studentIds.append(studentId)
  }
  
  // Approves the club if certain conditions are met
  func approve() throws {
    if studentIds.count < Club.minimumApproveStudentNumber {
      throw DomainException("Not enough students")
    }
    clubStatus = .approved
  }
  
  // Removes a student from the club
  func removeStudent(_ studentId: StudentId) {
    studentIds.removeAll { $0 == studentId }
    
    // If the number of members falls below the minimum, revoke approval
    if studentIds.count < Club.minimumApproveStudentNumber {
      clubStatus = .notApproved
    }
  }
}

