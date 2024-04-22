const showMoreMeatBtn = document.querySelector(".show_more_meat");
const showMoreVegetableBtn = document.querySelector(".show_more_vegetable");
const showMoreFruitBtn = document.querySelector(".show_more_fruit");
const showMoreSeafoodBtn = document.querySelector(".show_more_seafood");
const showMoreDairyBtn = document.querySelector(".show_more_dairy");
const meatItemAll = document.querySelector(".meat_item_all");
const vegetableItemAll = document.querySelector(".vegetable_item_all");
const fruitItemAll = document.querySelector(".fruit_item_all");
const seafoodItemAll = document.querySelector(".seafood_item_all");
const dairyItemAll = document.querySelector(".dairy_item_all");
const checkboxes = document.querySelectorAll(".checkbox");
const selectedItemsList = document.getElementById("selectedItems");

function showMoreMeat() {
  meatItemAll.style.display = "block";
}

function showMoreVegetable() {
  vegetableItemAll.style.display = "block";
}

function showMoreFruit() {
  fruitItemAll.style.display = "block";
}

function showMoreSeafood() {
  seafoodItemAll.style.display = "block";
}

function showMoreDairy() {
  dairyItemAll.style.display = "block";
}

function toggleMeat() {
  if (meatItemAll.style.display === "none") {
    meatItemAll.style.display = "block";
    showMoreMeatBtn.innerText = "닫기";
  } else {
    meatItemAll.style.display = "none";
    showMoreMeatBtn.innerText = "1개";
  }
}

function toggleVegetable() {
  if (vegetableItemAll.style.display === "none") {
    vegetableItemAll.style.display = "block";
    showMoreVegetableBtn.innerText = "닫기";
  } else {
    vegetableItemAll.style.display = "none";
    showMoreVegetableBtn.innerText = "20개";
  }
}

function toggleFruit() {
  if (fruitItemAll.style.display === "none") {
    fruitItemAll.style.display = "block";
    showMoreFruitBtn.innerText = "닫기";
  } else {
    fruitItemAll.style.display = "none";
    showMoreFruitBtn.innerText = "10개";
  }
}

function toggleSeafood() {
  if (seafoodItemAll.style.display === "none") {
    seafoodItemAll.style.display = "block";
    showMoreSeafoodBtn.innerText = "닫기";
  } else {
    seafoodItemAll.style.display = "none";
    showMoreSeafoodBtn.innerText = "8개";
  }
}

function toggleDairy() {
  if (dairyItemAll.style.display === "none") {
    dairyItemAll.style.display = "block";
    showMoreDairyBtn.innerText = "닫기";
  } else {
    dairyItemAll.style.display = "none";
    showMoreDairy.innerText = "1개";
  }
}

// 선택된 체크박스 리스트에 추가, 해제되면 삭제
checkboxes.forEach(function (checkbox) {
  checkbox.addEventListener("change", function () {
    if (this.checked) {
      // 체크박스가 선택되었을 때 리스트에 추가
      const listItem = document.createElement("li");
      listItem.textContent = this.value;
      selectedItemsList.appendChild(listItem);
    } else {
      // 체크박스가 선택 해제되었을 때 리스트에서 제거
      const items = selectedItemsList.querySelectorAll("li");
      items.forEach(function (item) {
        if (item.textContent === checkbox.value) {
          selectedItemsList.removeChild(item);
        }
      });
    }
  });
});

showMoreMeatBtn.addEventListener("click", toggleMeat);
showMoreVegetableBtn.addEventListener("click", toggleVegetable);
showMoreFruitBtn.addEventListener("click", toggleFruit);
showMoreSeafoodBtn.addEventListener("click", toggleSeafood);
showMoreDairyBtn.addEventListener("click", toggleDairy);
