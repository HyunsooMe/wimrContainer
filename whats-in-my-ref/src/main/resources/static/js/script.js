import foodList from "./foodList.js";

const checkboxes = document.querySelectorAll(".checkbox");
// 재료 검색창
const $search = document.querySelector("#search");
const $autoComplete = document.querySelector(".autocomplete");
// 레시피 검색 버튼
const $searchBtn = document.querySelector("#searchBtn");
const $addedList = document.querySelector(".addedlist");
let selectedItems = []; // 선택한 항목을 저장할 배열
$searchBtn.addEventListener("click", () => {
  const value = $search.value.trim();
  if (value) {
    addToAddedList(value); // 선택한 항목을 추가
    $search.value = ""; // 검색어 입력란 초기화
    $autoComplete.innerHTML = ""; // 자동완성 리스트 초기화
  }
});

//---------------------------------------------------------------
// 재료 검색 자동완성
let nowIndex = 0;

$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? foodList.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:
      document.querySelector("#search").value = matchDataList[nowIndex] || "";

      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;

    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex);
};

const showList = (data, value, nowIndex) => {
  // 정규식으로 변환
  const regex = new RegExp(`(${value})`, "g");

  $autoComplete.innerHTML = data
    .map(
      (label, index) => `
      <div class='${nowIndex === index ? "active" : ""}'>
        ${label.replace(regex, "<mark>$1</mark>")}
      </div>
    `
    )
    .join("");
};

//---------------------------------------------------------------

// 리스트에 선택한 재료 추가
const addToAddedList = (item) => {
  if (!selectedItems.includes(item)) {
    if (!foodList.includes(item)) {
      alert(`${item}은 목록에 없습니다`);
      return;
    }
    // 중복 추가 방지
    selectedItems.push(item); // 선택한 항목을 배열에 추가
    checkboxes.forEach((checkbox) => {
      if (checkbox.value == item) {
        checkbox.checked = true;
      }
    });
    console.log(selectedItems);
    renderAddedList(); // addedlist 업데이트
  }
};

// 리스트에서 선택한 재료 삭제
const removeFromAddedList = (item) => {
  selectedItems = selectedItems.filter((selectedItem) => selectedItem !== item);
  checkboxes.forEach((checkbox) => {
    if (checkbox.value == item) {
      checkbox.checked = false;
    }
  });
  console.log(selectedItems);
  renderAddedList(); // addedlist 업데이트
};

// 재료 추가,삭제 표시
const renderAddedList = () => {
  $addedList.innerHTML = ""; // 기존 리스트 초기화
  selectedItems.forEach((item) => {
    const listItem = document.createElement("div");
    listItem.textContent = item;
    listItem.classList.add("selectedFoods"); // 클래스 추가
    listItem.addEventListener("click", () => {
      removeFromAddedList(item); // 항목 클릭 시 삭제
    });
    $addedList.appendChild(listItem);
  });
};

checkboxes.forEach(function (checkbox) {
  checkbox.addEventListener("change", function () {
    if (this.checked) {
      addToAddedList(this.value);
      console.log(`"${this.value}" 가 선택되어 리스트에 추가되었습니다.`);
    } else {
      removeFromAddedList(checkbox.value);
      console.log(
        `"${checkbox.value}" 가 선택 해제되어 리스트에서 제거되었습니다.`
      );
    }
  });
});

// -------------------------------------------------------
// 서버로 selectedItems 배열을 보내는 함수

function submitSelectedItems() {
  console.log("서버에 전송");
  $.ajax({
    url: "http://localhost:8080/Wimr/foodSelect", // 서버의 API 주소
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify({ items: selectedItems }),
    success: function (response) {
      console.log("Success:", response);
    },
    error: function (xhr, status, error) {
      console.error("Error:", error);
    },
  });
}

// 전송 버튼 클릭 시 selectedItems 배열을 서버로 전송
findRecipeBtn.addEventListener("click", submitSelectedItems);
