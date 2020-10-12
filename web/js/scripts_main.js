//localhost 8443

function costToString(costInt) {
    if (costInt < 1000){
        return costInt.toString()
    }
    else{
        let thousands = Math.floor(costInt / 1000);
        let hundrets = costInt % 1000;
        if(hundrets == 0){
            return thousands.toString() + " 000";
        }
        else if (hundrets < 10){
            return thousands.toString() + " 00" + hundrets.toString();
        }
        else if (hundrets < 100){
            return thousands.toString() + " 0" + hundrets.toString();
        }
        else{
            return thousands.toString() + " " + hundrets.toString();
        }

    }
}

async function countItemCost (number){
    let cartItem = number.closest(".cart_item");
    let itemPrice = cartItem.querySelector(".price");
    let itemCost = cartItem.querySelector(".cost");

    try {
        console.log("POSTINGCHANGES")
        let itemEnt = {
            cartItemId: cartItem.getAttribute('idCartItem'),
            quantity: number.value
        };

        const response = await fetch('http://localhost:8080/', {
            method: 'post',
            body: JSON.stringify(itemEnt),
            bodyUsed: true
        });
    } catch (err) {
        console.log("Error: " + err);
    }


    if (number.value == 0) {
        itemCost.textContent = "0";
        countTotalCost();
        cartItem.style.display = "none";
        return;
    }

    itemPrice = parseInt(itemPrice.textContent.replace(/\s+/g,''));

    let cost = itemPrice * number.value;

    itemCost.textContent = costToString(cost);

    countTotalCost();
}

function countTotalCost(){
    let allPricesItems = document.getElementsByClassName("cost");
    let allPrices = [];
    for (i = 0; i < allPricesItems.length; i++){
        allPrices.push(parseInt(allPricesItems[i].textContent.replace(/\s+/g, '')))
    }
    let totalCost = 0;
    allPrices.forEach(function (item) {
        totalCost += item
    });
    let priceTotalItem = document.getElementById("price-total");
    priceTotalItem.textContent = costToString(totalCost);
}

async function addToCart(item){
    const urlParams = new URLSearchParams(window.location.search);
    const userId = urlParams.get('userid');

    if (userId != null) {
        try {
            let itemEnt = {
                articool: item.getAttribute('articool'),
                userId: userId
            };

            const response = await fetch('http://localhost:8080/', {
                method: 'post',
                body: JSON.stringify(itemEnt),
                bodyUsed: true
            });
        } catch (err) {
            console.log("Error: " + err);
        }
        console.log("added to cart: " + item.getAttribute('articool') + " " + userId);
        alert("Товар добавлен в корзину");
    }
}

window.onload = function () {
    const popupWrap = document.getElementById("popup_wrap");
    popupWrap.style.display = "none";
}

function closeCart(){
    const popup_wrap = document.getElementById("popup_wrap");
    popup_wrap.classList.remove("overlay_target");
    popup_wrap.classList.add("overlay");
}

async function showCart(){
    const urlParams = new URLSearchParams(window.location.search);
    const userId = urlParams.get('userid');

    const currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;

    if (userId != null) {
        try {
            let xhr = new XMLHttpRequest();
            xhr.open('GET', currentURL+'?userid=' + userId + '&popup_wrap=true', true);
            xhr.send();


            xhr.onreadystatechange = function () {
                if (xhr.status == 200) {
                    //console.log("CHANGED TO " + xhr.responseText + "\n STATUS: " + xhr.status);
                    //let cartContent = document.createElement(xhr.responseText);
                    const close_cross = "<a class=\"close_cross\" onclick='closeCart()'>&times;</a>" + "\n";
                    let popup = document.getElementById("popup");
                    popup.innerHTML = close_cross + xhr.responseText;
                    popup.scrollTop;


                    const popupWrap = document.getElementById("popup_wrap");
                    const cartItem = popupWrap.querySelectorAll(".cart_item");

                    //console.log("cartitem length: " + cartItem.length.toString());
                    for (i = 0; i < cartItem.length; i++) {
                        let inputTag = cartItem[i].querySelector("input");
                        let quantity = inputTag.value;
                        //console.log("quantity: " + quantity);
                        if (quantity == 0) {
                            //console.log("HIDING")
                            //cartItem[i].style.display = "none";
                            cartItem[i].parentElement.removeChild(cartItem[i]);
                        }
                    }
                    if (cartItem.length != 0){
                        countTotalCost();
                    }

                    popupWrap.style.display = "block";
                    popupWrap.classList.remove("overlay");
                    popupWrap.classList.add("overlay_target");
                }
            }
            /*if (xhr.status != 200) {
                // обработать ошибку
                alert( xhr.status + ': ' + xhr.statusText ); // пример вывода: 404: Not Found
            } else {
                // вывести результат
                console.log(xhr.response)
            }*/

        } catch (err) {
            console.log("Error: " + err);
        }
    }
    else {
        alert("Пожалуйста, войдите в линый кабинет!")
    }
}