//
//  File.swift
//  RockPaperScissors
//
//  Created by Admin on 19.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import AVFoundation
import Speech
//import AudioKit

class VocoAudio{
    
    @objc var engine: AVAudioEngine?
    @objc var mp3buf = UnsafeMutablePointer<UInt8>.allocate(capacity: 4096)
    @objc var file = NSMutableData()
    var isRecording = false
    
    var Stt = ""
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "tr-TR"));
    var recognitionRequest = SFSpeechAudioBufferRecognitionRequest();
    var recognitionTask = SFSpeechRecognitionTask();
    
    deinit {
        mp3buf.deallocate()
    }
    
    init(){
        engine = AVAudioEngine()
        guard nil != engine?.inputNode else {
            // @TODO: error out
            return
        }
    }
    
    @objc func installTap(_ sttfinished: @escaping () -> Void) {
        // onTapToTalk
        self.engine = AVAudioEngine()
        let engine = self.engine
        let input = engine?.inputNode
        
        self.isRecording = true
        let format = input?.inputFormat(forBus: 0)
        
        recognitionRequest.shouldReportPartialResults = true;
        recognitionTask = (speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            if error == nil{
                if result != nil {
                    if result!.isFinal {
                        self.Stt.append( result!.bestTranscription.formattedString + ". ")
                        self.recognitionRequest.endAudio()
                        sttfinished()
                    }
                }
            } else {
                self.recognitionRequest.endAudio()
                sttfinished()
            }
        }))!
        
        input?.installTap(onBus: 0, bufferSize:4096, format:format, block: { [weak self] buffer, when in
            guard let this = self else {
                return
            }
            this.recognitionRequest.append(buffer)
        })
        engine?.prepare()
        do {
            try engine?.start()
        } catch {
        }
    }
    
    
    @objc func removeTap() {
        //pausing record
        engine?.inputNode.removeTap(onBus: 0)
        engine = nil
        recognitionRequest.endAudio();
    }
}


