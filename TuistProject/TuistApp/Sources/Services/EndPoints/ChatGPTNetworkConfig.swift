//
//  ChatGPTEndPoint.swift
//  KakaoTalkUIPractice
//
//  Created by BEYun on 2023/04/13.
//

import Foundation

enum ChatGPTNetworkConfig {
    case completions
}

extension ChatGPTNetworkConfig {
    var url: URL {
        get throws {
            switch self {
            case .completions:
                return try URL.makeChatGPTURL("/v1/chat/completions")
            }
        }
    }
}

private extension URL {
    static func makeChatGPTURL(_ endpoint: String) throws -> URL {
        guard let url = URL(string: "https://api.openai.com\(endpoint)") else {
            throw NetworkError.invalidURL
        }
        return url
    }
}
