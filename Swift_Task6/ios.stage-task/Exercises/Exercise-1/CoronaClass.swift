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
        return 0
     }
     
     func leave(_ p: Int) {
         guard seats.contains(p) else { return }
         studentsCount -= 1
         if let indexP = seats.firstIndex(of: p) {
            seats.remove(at: indexP)
         }
     }
}

