//
//  50 sound.swift
//  50 sound
//
//  Created by 陳韋綸 on 2022/3/19.
//

import Foundation

class Tone {
    
    static let shared = Tone()
    /*
    let tone = [
        "ᅡ","ᅥ","ᅩ","ᅮ","ᅳ","ᅵ",
        "ᅣ","ᅧ","ᅭ","ᅲ"," "," ",
        "ᅪ","ᅯ"," "," "," "," ",
        "ᅢ","ᅦ","ᅬ","ᅱ","ㅢ"," ",
        "ᅤ","ᅨ"," "," "," "," ",
        "ᅫ","ᅰ"," "," "," "," ",
        "ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ",
        "ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ",
        "ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ",
        "ㅎ"
    ]
    */
    func hiraganaTone() -> [String] {
        let tone = [
            "ᅡ","ᅥ","ᅩ","ᅮ","ᅳ","ᅵ",
            "ᅣ","ᅧ","ᅭ","ᅲ"," "," ",
            "ᅪ","ᅯ"," "," "," "," ",
            "ᅢ","ᅦ","ᅬ","ᅱ","ㅢ"," ",
            "ᅤ","ᅨ"," "," "," "," ",
            "ᅫ","ᅰ"," "," "," "," ",
            "ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ",
            "ㄲ"," ","ㄸ"," "," ","ㅃ",
            "ㅅ","ㅇ","ㅈ","ㅋ","ㅌ","ㅍ",
            "ㅆ"," ","ㅉ"," "," "," ",
            "ㅎ"," ","ㅊ"
        ]
        return tone
    }
    
    func katakanaTone() -> [String] {
        let tone = [
            "ア","イ","ウ","エ","オ",
            "カ","キ","ク","ケ","コ",
            "サ","シ","ス","セ","ソ",
            "タ","チ","ツ","テ","ト",
            "ナ","ニ","ヌ","ネ","ノ",
            "ハ","ヒ","フ","ヘ","ホ",
            "マ","ミ","ム","メ","モ",
            "ラ","リ","ル","レ","ロ",
            "ヤ","ユ","ヨ","ワ","ヲ"
        ]
        return tone
    }
    
    func chineseTone() -> [String] {
        let tone = [
            "ᅡ","ᅥ","ᅩ","ᅮ","ᅳ","ᅵ",
            "ᅣ","ᅧ","ᅭ","ᅲ"," "," ",
            "ᅪ","ᅯ"," "," "," "," ",
            "ᅢ","ᅦ","ᅬ","ᅱ","ㅢ"," ",
            "ᅤ","ᅨ"," "," "," "," ",
            "ᅫ","ᅰ"," "," "," "," ",
            "ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ",
            "ㄲ"," ","ㄸ"," "," ","ㅃ",
            "ㅅ","ㅇ","ㅈ","ㅋ","ㅌ","ㅍ",
            "ㅆ"," ","ㅉ"," "," "," ",
            "ㅎ"," ","ㅊ"
        ]
        return tone
    }
    
//    func chineseTone() -> [String] {
//        let tone = [
//            "ㄚ","ㄡ","ㄛ","","（ㄜ）","ㄧ",
//            "ya","ㄧㄡ","ᅭ","ᅲ"," "," ",
//            "ㄨㄚ","ㄨㄡ"," "," "," "," ",
//            "ㄟ","ㄟ","ᅬ","ᅱ","ㅢ"," ",
//            "ㄧㄟ","ㄧㄟ"," "," "," "," ",
//            "ㄨㄟ","ㄨㄟ"," "," "," "," ",
//            "ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ",
//            "ㄲ"," ","ㄸ"," "," ","ㅃ",
//            "ㅅ","ㅇ","ㅈ","ㅋ","ㅌ","ㅍ",
//            "ㅆ"," ","ㅉ"," "," "," ",
//            "ㅎ"," ","ㅊ"
//        ]
//        return tone
//    }
     
}
