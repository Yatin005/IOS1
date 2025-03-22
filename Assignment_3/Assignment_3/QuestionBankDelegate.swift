//
//  QuestionBankDelegate.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import Foundation

protocol QuestionBankDelegate: AnyObject {
    func didAddQuestion(_ question: Questions)
    func didUpdateQuestion(_ question: Questions)
}
