//function A
function addNumbers(ArrayOfNumbers){
    let total=0;
    for (let i=0; i<ArrayOfNumbers.length;i++) { total+=ArrayOfNumbers[i] }
    //i represents the index of each element
        //everytime we take the element as the current index, 
        //and add it to the total
  return total;
} 

//function B
function findMaxNumber(){
    return Math.max(...arguments);
}

//function C
function addOnlyNumbers(mixedArray){
    let total=0;
for (let i=0; i<mixedArray.length;i++) {
    let number=parseFloat(mixedArray[i]);
if (!isNaN(number)) {
    total += number;
}
}
return total;
} 

//function D
function getDigits(stringInput){
    let numbers='';
for(let i=0;i<stringInput.length;i++) {
    if(!isNaN(stringInput[i])&& stringInput[i]!==' ') { //we ignore all characters that are not numbers, including white spaces.
        numbers+=stringInput[i];
    }

}
return numbers;
}

//function E
function reverseString(stringInput){
    let reversedString='';
for(let i=stringInput.length-1;i>=0;i--) {
    reversedString+=stringInput[i];
}
return reversedString;
} 

//function F
function getCurrentDate(){
    const options = { weekday: 'long', year: 'numeric', month: 'short', day: 'numeric' };
    return new Date().toLocaleDateString('en-US', options);
}


//Demonstration of each method: 
function demonstrateFunctions() {

    //addNumbers()-Function A:
const ArrayOfNumbers=[1,2,3,4,5,6];
document.getElementById('totalOfArray').innerText = addNumbers(ArrayOfNumbers);

//findMaxNumber()-Function B:
const maximum = findMaxNumber(1, 2, 3, 4, 5);
document.getElementById('maximumNumber').innerText = maximum;

//addOnlyNumbers()- Function C:
const mixedArray=[4,5,"3.0 birds", true, "birds2"];
document.getElementById('addOnlyNumbers').innerText = addOnlyNumbers(mixedArray);

//getDigits()-Function D
let stringInput="4abc3abc3abc4abc"
document.getElementById('getDigits').innerText = getDigits(stringInput);

//reverseString()-Function E
let originalString='haha hihi houhou testing code!!!!';
document.getElementById('reversedString').innerText = reverseString(originalString);


//getCurrentDate()- Function F
document.getElementById('currentDate').innerText = getCurrentDate();
}

document.addEventListener('DOMContentLoaded', demonstrateFunctions);