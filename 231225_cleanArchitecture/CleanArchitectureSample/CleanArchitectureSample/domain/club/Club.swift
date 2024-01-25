//
//  Club.swift
//  CleanArchitectureSample
//
import Foundation

// 識別可能で、Codableプロトコルに準拠するClubクラス
class Club: Identifiable, Codable {
  var clubId: ClubId
  var name: String
  var clubStatus: ClubStatus
  var createdAt: Date
  var studentIds: [StudentId]
  
  // 承認に必要な最小生徒数
  private static let minimumApproveStudentNumber = 5
  
  // コンストラクタ
  init(name: String) {
    self.clubId = ClubId() // ClubIdにイニシャライザがあると仮定
    self.name = name
    self.clubStatus = .notApproved
    self.studentIds = []
    self.createdAt = Date()
  }
  
  // 全てのプロパティを初期化するコンストラクタ
  init(clubId: ClubId, name: String, clubStatus: ClubStatus, createdAt: Date, studentIds: [StudentId]) {
    self.clubId = clubId
    self.name = name
    self.clubStatus = clubStatus
    self.createdAt = createdAt
    self.studentIds = studentIds
  }
  
  // 生徒をクラブに追加する
  func addStudent(_ studentId: StudentId) throws {
    if studentIds.contains(studentId) {
      throw DomainException("生徒はすでに登録されています")
    }
    studentIds.append(studentId)
  }
  
  // 特定の条件が満たされた場合にクラブを承認する
  func approve() throws {
    if studentIds.count < Club.minimumApproveStudentNumber {
      throw DomainException("生徒数が不足しています")
    }
    clubStatus = .approved
  }
  
  // 生徒をクラブから削除する
  func removeStudent(_ studentId: StudentId) {
    studentIds.removeAll { $0 == studentId }
    
    // メンバー数が最小数を下回った場合、承認を取り消す
    if studentIds.count < Club.minimumApproveStudentNumber {
      clubStatus = .notApproved
    }
  }
}
