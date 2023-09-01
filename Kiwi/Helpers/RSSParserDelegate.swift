//
//  RSSParserDelegate.swift
//  Kiwi
//
//  Created by Gustavo rodrigues on 2023/9/1.
//

import Foundation

class RSSParserDelegate: NSObject, XMLParserDelegate {
    var articles: [NewsArticle] = []
    var currentElement: String?
    var currentTitle: String = ""
    var currentLink: String = ""
    var currentDescription: String = ""
    var isParsingFinanceArticle = false

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if elementName == "item" {
            currentTitle = ""
            currentLink = ""
            currentDescription = ""
            isParsingFinanceArticle = false
        }
        // Add conditions to check for finance-related keywords or categories
        if elementName == "category" {
            if let category = attributeDict["domain"], category.contains("finance") {
                isParsingFinanceArticle = true
            }
        }
    }


    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += isParsingFinanceArticle ? string : ""
        case "link":
            currentLink += isParsingFinanceArticle ? string : ""
        case "description":
            currentDescription += isParsingFinanceArticle ? string : ""
        default:
            break
        }
    }


    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" && isParsingFinanceArticle {
            let article = NewsArticle(title: currentTitle, link: currentLink, description: currentDescription)
            articles.append(article)
            isParsingFinanceArticle = false
        }
        currentElement = nil
    }

}

