/*
The school cafeteria offers circular and square sandwiches at lunch break, referred to by numbers 0 and 1 respectively. All students stand in a queue. Each student either prefers square or circular sandwiches.

The number of sandwiches in the cafeteria is equal to the number of students. The sandwiches are placed in a stack. At each step:

If the student at the front of the queue prefers the sandwich on the top of the stack, they will take it and leave the queue.
Otherwise, they will leave it and go to the queue's end.
This continues until none of the queue students want to take the top sandwich and are thus unable to eat.

You are given two integer arrays students and sandwiches where sandwiches[i] is the type of the i​​​​​​th sandwich in the stack (i = 0 is the top of the stack) and students[j] is the preference of the j​​​​​​th student in the initial queue (j = 0 is the front of the queue). Return the number of students that are unable to eat.

 

Example 1:

Input: students = [1,1,0,0], sandwiches = [0,1,0,1]
Output: 0 
Explanation:
- Front student leaves the top sandwich and returns to the end of the line making students = [1,0,0,1].
- Front student leaves the top sandwich and returns to the end of the line making students = [0,0,1,1].
- Front student takes the top sandwich and leaves the line making students = [0,1,1] and sandwiches = [1,0,1].
- Front student leaves the top sandwich and returns to the end of the line making students = [1,1,0].
- Front student takes the top sandwich and leaves the line making students = [1,0] and sandwiches = [0,1].
- Front student leaves the top sandwich and returns to the end of the line making students = [0,1].
- Front student takes the top sandwich and leaves the line making students = [1] and sandwiches = [1].
- Front student takes the top sandwich and leaves the line making students = [] and sandwiches = [].
Hence all students are able to eat.
Example 2:

Input: students = [1,1,1,0,0,1], sandwiches = [1,0,0,0,1,1]
Output: 3
 

Constraints:

1 <= students.length, sandwiches.length <= 100
students.length == sandwiches.length
sandwiches[i] is 0 or 1.
students[i] is 0 or 1.
*/

class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var countStudentLikeCircularSandwich = 0
        var countStudentLikeSquareSandwich = 0

        var i = 0

        while i < students.count {
            if students[i] == 0{
                countStudentLikeCircularSandwich += 1
            } else if students[i] == 1{
                countStudentLikeSquareSandwich += 1
            }
            i += 1
        }
        
        for sandwich in sandwiches {
            if sandwich == 0 {
                if countStudentLikeCircularSandwich < 1 {
                   break
                }
                countStudentLikeCircularSandwich -= 1
            } else {
                 if countStudentLikeSquareSandwich < 1 {
                    break
                 }
                countStudentLikeSquareSandwich -= 1
                
            }
        }
        return abs(countStudentLikeCircularSandwich + countStudentLikeSquareSandwich)
    }
}

class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var counts = [0, 0]
        for student in students {
            counts[student] += 1
        }
        
        for sandwich in sandwiches {
            if counts[sandwich] == 0 {
                break
            }
            counts[sandwich] -= 1
        }
        return counts[0] + counts[1]
    }
}

let students = [1,1,0,0]
let sandwiches = [0,1,0,1]

let result = Solution().countStudents(students, sandwiches)
print(result)