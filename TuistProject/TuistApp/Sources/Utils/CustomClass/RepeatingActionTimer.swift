//
//  RepeatingActionTimer.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/21.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

enum TimerState {
    case suspended
    case resumed
}

protocol RepeatingTimer {
    var timerState: TimerState { get }
    
    func makeTimer(deadline: DispatchTime, repeating: Int, completion: @escaping () -> Void)
    func resumeTimer()
    func suspendTimer()
    func cancelTimer()
}


class RepeatingActionTimer: RepeatingTimer {
    var timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    
    var timerState: TimerState = .resumed
    
    func makeTimer(deadline: DispatchTime, repeating: Int, completion: @escaping () -> Void) {
        timer.schedule(deadline: deadline, repeating: .seconds(repeating))
        timer.setEventHandler(handler: {
            completion()
        })
        timer.resume()
    }
    
    func resumeTimer() {
        guard timerState == .suspended else { return }
        timerState = .resumed
        timer.resume()
    }
    
    func suspendTimer() {
        guard timerState == .resumed else { return }
        timerState = .suspended
        timer.suspend()
    }
    
    func cancelTimer() {
        timerState = .resumed
        timer.cancel()
    }
}
