import Foundation

class CoronaClass {
 
     var studentsCount: Int = 0
     var seats = [Int]()
     let desksCount: Int

     init(n: Int) {
        self.desksCount = n
     }
     
     func seat() -> Int {
        if studentsCount == 0 {
            studentsCount += 1
            seats.append(0)
            return 0
        }
        if studentsCount == 1 {
            studentsCount += 1
            seats.append(desksCount - 1)
            return desksCount - 1
        }
        studentsCount += 1
        let result = distanse()
        let studentDisptance = result.0 / 2
        let startSeat =  result.1
//        let delta = startSeat == 0 && studentsCount == 3 ? 1 : 0
        let newStudentSeat = studentDisptance + startSeat
        seats.append(newStudentSeat)
        seats.sort(by: { $0 < $1})
        return newStudentSeat
     }
    
    func distanse() -> (Int, Int) {
        var newSeats = seats
        var resultDistanse: Int = 0
        var startSeat: Int = 0
        for (index, seat) in newSeats.enumerated() {
            if index == newSeats.count - 1 {
                break
            }
            let nextSeat = newSeats[index + 1]
            let distanse = nextSeat - seat
            if distanse > resultDistanse {
                resultDistanse = distanse
                startSeat = seat
            }
        }
        return (resultDistanse, startSeat)
    }
     
     func leave(_ p: Int) {
         guard seats.contains(p) else { return }
         studentsCount -= 1
         if let indexP = seats.firstIndex(of: p) {
            seats.remove(at: indexP)
         }
     }
}

