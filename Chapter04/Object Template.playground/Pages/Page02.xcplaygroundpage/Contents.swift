//:## 緊密耦合的問題
/*:
 - Note:
 `鬆散耦合`就是設計模式的重要目標。
 */
/*:
 - Note:
 `緊密耦合`的元件會讓程式難以維護，需要花更多力氣去做變更及測試。
 變更一個元件時會變更與其相關的實作，這些耦合會蔓延到整個程式，一個簡單的功能異動都會導致大量的重工。
*/
//:- - -
// 若移除原先 employees Turple 中的 type value
let employees = [
  (name: "Alan", salary: 50.0, seniority: 5.0),
  (name: "Bob", salary: 22.0, seniority: 3.0) ]

// 因為方法與資料的緊密耦合，因此當資料有異動時也會連帶影響到calculateTotalbonus()方法
func calculateTotalbonus(employees: [(String, Double, Double)]) -> Double {
  return employees.reduce(0, { (total,  employe) in
    total + ((employe.2 * 0.04) * employe.1)
  })
}

print("Total bonus of employees: $\(calculateTotalbonus(employees: employees))")
//: [建立資料物件](Page03)
