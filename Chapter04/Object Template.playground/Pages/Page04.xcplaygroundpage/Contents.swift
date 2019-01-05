//:## 建立Class或Struct的好處
/*:
 - Note:
 建立 Class或Struct的好處是它可以支援封裝。`封裝讓資料及運算邏輯結合在單一元件`中，因為與資料型別相關的所有事情都定義在同一個地方，因此可以提升程式碼的`可讀性`。
*/
//:- - -
class Employe {
  
  var name: String {
    get { return _name }
    set { _name = newValue.isEmpty ? "Unknown Name" : newValue }
  }
  
  var department: String?
  var salary: Double
  var seniority: Double
  private var _name = "Unknown Name"
  
  init(name: String, department: String? = nil, salary: Double, seniority: Double) {
    _name = name
    self.department = department
    self.salary = salary
    self.seniority = seniority
  }
  
  var bonus: Double {
    return (seniority * 0.04) * salary
  }
  
}
//:- - -
let employees = [
  Employe(name: "Alan", salary: 50.0, seniority: 5.0),
  Employe(name: "Bob", salary: 22.0, seniority: 3.0)
]

func calculateTotalbonus(employees: [Employe]) -> Double {
  return employees.reduce(0, { (total,  employe) in
    total + employe.bonus
  })
}

print("Total bonus of employees: $\(calculateTotalbonus(employees: employees))")

print("First employe name (Before): \(employees.first?.name ?? "")")
employees.first?.name = ""
print("First employe name (After): \(employees.first?.name ?? "")")
//: [Object Template 模式](Page01)
