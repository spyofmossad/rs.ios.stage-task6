import Foundation

class CoronaClass {
 
    var seats = [Int]()
    
    var tablesCount: Int

    init(n: Int) {
        tablesCount = n
    }
     
    func seat() -> Int {
        if seats.isEmpty {
            seats.append(0)
            return 0
        }
    
        var freeSpaceDelta = 0
        var value = 0
        var index = 0
        
        for n in 0...seats.count - 1 {
            if seats.first == seats[n] {
                if seats[n] > freeSpaceDelta {
                    freeSpaceDelta = seats[n]
                }
            }
            
            if seats.last == seats[n] {
                if (tablesCount - 1) - seats[n] > freeSpaceDelta {
                    freeSpaceDelta = (tablesCount - 1) - seats[n]
                    value = seats[n] + freeSpaceDelta
                    index = n+1
                }
            } else {
                let possibleDelta = (abs(seats[n] - seats[n+1])) / 2
                if possibleDelta > freeSpaceDelta {
                    freeSpaceDelta = possibleDelta
                    value = seats[n] + freeSpaceDelta
                    index = n+1
                }
            }
        }
        seats.insert(value, at: index)
                
        return value
    }

    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
