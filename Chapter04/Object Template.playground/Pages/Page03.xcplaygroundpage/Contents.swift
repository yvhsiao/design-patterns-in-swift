//:## 建立資料物件
/*:
 - Note:
 Class 與 Struct 的改變範圍只在受直接影響的程式內且不會產生如前面turple型態引起的擴散。
 */
/*:
 - Note:
 將資料包成物件之後，不論有沒有department屬性都不影響calculateTotalbonus()方法的計算結果，這是因為Employe`類別中的每個屬性都是獨立定義與存取`，且calculateTotalbonus()方法也沒有依賴department屬性。
 */
//:- - -
class Employe {
  
  var name: String
  var department: String?
  var salary: Double
  var seniority: Double
  
  init(name: String, department: String? = nil, salary: Double, seniority: Double) {
    self.name = name
    self.department = department
    self.salary = salary
    self.seniority = seniority
  }
  
}
//:- - -
let employees = [
  Employe(name: "Alan", salary: 50.0, seniority: 5.0),
  Employe(name: "Bob", salary: 22.0, seniority: 3.0)
]

let employeesWithDEPT = [
  Employe(name: "Alan", department: "RD", salary: 50.0, seniority: 5.0),
  Employe(name: "Bob", department: "HR", salary: 22.0, seniority: 3.0)
]

func calculateTotalbonus(employees: [Employe]) -> Double {
  return employees.reduce(0, { (total,  employe) in
    total + ((employe.seniority * 0.04) * employe.salary)
  })
}

print("Total bonus of employees: $\(calculateTotalbonus(employees: employees))")
print("Total bonus of employees: $\(calculateTotalbonus(employees: employeesWithDEPT))")
//: [建立Class或Struct的好處](Page04)
