import Foundation

func convertSeconds(seconds: Int, clockArr: inout [Int]) {
    clockArr[0] = (seconds % 2 == 0 ? 1 : 0)
}

func convertMinutes(minutes: Int, clockArr: inout [Int]) {
    var lamps = 0
    
    if minutes > 4 {
        lamps = minutes / 5
        for i in Range(9...lamps + 8){
            clockArr[i] = 1
        }
    }
    
    lamps = minutes % 5
    if lamps > 0{
        for i in Range(20...lamps + 19){
            clockArr[i] = 1
        }
    }
}
func convertHours(hours: Int, clockArr: inout [Int]) {
    var lamps = 0
    if hours > 4{
        lamps = hours / 5
        for i in Range(1...lamps){
            clockArr[i] = 1
        }
    }
    
    lamps = hours % 5
    if lamps > 0{
        for i in Range(5...lamps + 4){
            clockArr[i] = 1
        }
    }
}

var seconds = 0, minutes = 0, hours = 0

print("Input hours: ")
if let unwrappedHours = readLine(){
    if let unwrappedInt = Int(unwrappedHours){
        hours = unwrappedInt
    }
    else{
        error()
    }
}


print("Input minutes: ")
if let unwrappedMinutes = readLine(){
    if let unwrappedInt = Int(unwrappedMinutes){
        minutes = unwrappedInt
    }
    else{
        error()
    }
}

print("Input seconds: ")
if let unwrappedSeconds = readLine(){
    if let unwrappedInt = Int(unwrappedSeconds){
        seconds = unwrappedInt
    }
    else{
        error()
    }
}

var clockArr: [Int] = []

for _ in Range(0...23){
    clockArr.append(0)
}

print()

// lazy solution
if seconds < 0 || seconds >= 60 || minutes < 0 || minutes >= 60 || hours < 0 || hours > 23{
    error()
}

convertSeconds(seconds: seconds, clockArr: &clockArr)
convertHours(hours: hours, clockArr: &clockArr)
convertMinutes(minutes: minutes, clockArr: &clockArr)

print(clockArr[0...0])
print(clockArr[1...4])
print(clockArr[5...8])
print(clockArr[9...19])
print(clockArr[20...23])


func error(){
    print("Give me valid input or I'm going to blow up your computer")
    exit(0)
}
