//
//  StudentRepository.swift
//  CleanArchitectureSample
//

import Foundation

protocol StudentRepository {
    func findById(_ studentId: StudentId) -> Student?
    func save(_ student: Student)
}

