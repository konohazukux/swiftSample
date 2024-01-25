//
//  Student.swift
//  CleanArchitectureSample
//

import Foundation

class Student {
    let studentId: StudentId
    var studentName: String

    init(studentName: String) {
        self.studentId = StudentId() // Assuming StudentId has an initializer
        self.studentName = studentName
    }
}

