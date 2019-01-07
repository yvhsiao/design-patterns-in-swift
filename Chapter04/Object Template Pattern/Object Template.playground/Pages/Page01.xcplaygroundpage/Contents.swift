//:# Object Template 模式
//:* [Reference](https://github.com/Apress/pro-design-patterns-in-swift/tree/master/Chapter%2004/ObjectTemplate)
//:- - -
let employees = [
  (name: "Alan", department: "RD", salary: 50.0, seniority:  5.0),
  (name: "Bob", department: "HR", salary: 22.0, seniority: 3.0) ]

func calculateTotalbonus(employees: [(String, String, Double, Double)]) -> Double {
  return employees.reduce(0, { (total,  employe) in
    total + ((employe.3 * 0.04) * employe.2)
  })
}

print("Total bonus of employees: $\(calculateTotalbonus(employees: employees))")
//: [緊密耦合的問題](Page02)
