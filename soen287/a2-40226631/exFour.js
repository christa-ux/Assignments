function calculate() {
    const quantity1 = document.getElementById('quantity1').querySelector('input').value.trim();
    const quantity2 = document.getElementById('quantity2').querySelector('input').value.trim();
    const quantity3 = document.getElementById('quantity3').querySelector('input').value.trim();
    
    //if the input (which is of type string) is empty, or if it's not an integer ---> Alert
    if (!isInteger(quantity1) || !isInteger(quantity2) || !isInteger(quantity3)) {
        alert('Please enter valid integer quantities for all items.');
        return;
    }

//converting each string quantity that is a number, into an actual integer. 
    const qty1 = parseInt(quantity1);
    const qty2 = parseInt(quantity2);
    const qty3 = parseInt(quantity3);


    //price of each unit
    let price1 = 19.99;
    let price2 = 86.00;
    let price3 = 55.00;

    let total1 = qty1 * price1;
    let total2 = qty2 * price2;
    let total3 = qty3 * price3;

    let totalCost = total1 + total2 + total3;

    let output1 = `Basic Web Programming (Quantity=${qty1}): $${total1.toFixed(2)}`;
    let output2 = `Intro to PHP (Quantity=${qty2}): $${total2.toFixed(2)}`;
    let output3 = `Advanced jQuery (Quantity=${qty3}): $${total3.toFixed(2)}`;
    let outputTotal = `Final Total: $${totalCost.toFixed(2)}`;

    //to display the output
    let outputContainer = document.getElementById('output');
    outputContainer.innerHTML = `<p>${output1}</p><p>${output2}</p><p>${output3}</p><p><strong>${outputTotal}</strong></p>`;
}

function isInteger(value) {
    return /^\d+$/.test(value);
}

