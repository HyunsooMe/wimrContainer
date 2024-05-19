const checkboxes = document.querySelectorAll(".checkbox");
const selectedItemsList = document.querySelector(".addedlist");
const $search = document.querySelector("#search");
const $autoComplete = document.querySelector(".autocomplete");
const $searchBtn = document.querySelector("#searchBtn");
const $addedList = document.querySelector(".addedlist");
let selectedItems = []; // 선택한 항목을 저장할 배열

// 요리 레시피를 표시하는 div에 대한 참조 가져오기
const recipeResults = document.getElementById("recipe-results");

// 선택된 체크박스 리스트에 추가, 해제되면 삭제
findRecipeBtn.addEventListener("click", getFoodRecipe);

const dataList = [
  "양파",
  "토마토",
  "상추",
  "소고기",
  "닭고기",
  "돼지고기",
  "양고기",
  "고추",
  "감자",
  "고구마",
  "당근",
  "오이",
  "가지",
  "파프리카",
  "버섯",
  "무",
  "호박",
  "애호박",
  "깻잎",
  "도라지",
  "쪽파",
];

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

function getFoodRecipe() {
  if (selectedItems.length === 0) {
    alert("재료를 입력하세요");
    return;
  }

  let apiUrl = `http://openapi.foodsafetykorea.go.kr/api/f415b345bda946528b8e/COOKRCP01/json/0/1000/`;

  fetch(apiUrl)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      if (data && data.COOKRCP01 && data.COOKRCP01.row) {
        const recipes = data.COOKRCP01.row;
        const filteredRecipes = recipes.filter((recipe) =>
          selectedItems.every((item) => recipe.RCP_PARTS_DTLS.includes(item))
        );
        console.log(filteredRecipes);
        displayRecipes(filteredRecipes);
      } else {
        console.error("Unexpected data structure", data);
      }
    })
    .catch((error) => {
      console.error(
        "There has been a problem with your fetch operation:",
        error
      );
    });
}

function displayRecipes(recipes) {
  const recipesDiv = document.getElementById("recipe-results");
  recipesDiv.innerHTML = "";
  if (recipes.length === 0) {
    recipesDiv.textContent = "해당 재료를 포함한 레시피가 없습니다.";
    return;
  }

  recipes.forEach((recipe, index) => {
    const recipeDiv = document.createElement("div");
    recipeDiv.className = "recipe";
    // 요리 이름 생성
    const title = document.createElement("h3");
    title.textContent = recipe.RCP_NM;
    // 요리 사진 생성
    const img = document.createElement("img");
    img.src = recipe.ATT_FILE_NO_MAIN || recipe.ATT_FILE_NO_MK;
    // const parts = document.createElement("p");
    // parts.textContent = "재료: " + recipe.RCP_PARTS_DTLS;
    // const instructions = document.createElement("p");
    // instructions.innerHTML =
    //   recipe.MANUAL01 + "<br>" + recipe.MANUAL02 + "<br>" + recipe.MANUAL03;
    // 요리 이름과 사진을 각 recipeDiv에 추가
    recipeDiv.appendChild(img);
    recipeDiv.appendChild(title);
    recipesDiv.appendChild(recipeDiv);
    // recipeDiv를 recipesDiv에 추가
    // recipesDiv.appendChild(containerDiv);
    // recipeDiv.appendChild(parts);
    // recipeDiv.appendChild(instructions);
  });
}

// 상위 요소에 클릭 이벤트 리스너 추가 (이벤트 위임)
recipeResults.addEventListener("click", function (event) {
  const clickedElement = event.target;
  if (clickedElement.tagName === "IMG" || clickedElement.tagName === "H3") {
    console.log("클릭됨");
    // 요리 레시피의 ID를 가져오기
    // const recipeId = recipeDiv.dataset.recipeId  ;
    // 여기에 클릭했을 때 실행할 코드 추가
    // const url = `/recipe/${recipeId}`;
    // 새 창으로 이동
    // window.open(url, "_blank");
  }
});

$searchBtn.addEventListener("click", () => {
  const value = $search.value.trim();
  if (value) {
    addToAddedList(value); // 선택한 항목을 추가
    $search.value = ""; // 검색어 입력란 초기화
    $autoComplete.innerHTML = ""; // 자동완성 리스트 초기화
  }
});

let nowIndex = 0;

$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? dataList.filter((label) => label.includes(value))
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

const selectItem = (index) => {
  $search.value = matchDataList[index];
  addToAddedList($search.value); // 선택한 항목을 추가
  $autoComplete.innerHTML = "";
  nowIndex = 0;
};

const addToAddedList = (item) => {
  if (!selectedItems.includes(item)) {
    // 중복 추가 방지
    selectedItems.push(item); // 선택한 항목을 배열에 추가
    checkboxes.forEach((checkbox) => {
      if (checkbox.value == item) {
        checkbox.checked = true;
      }
    });
    renderAddedList(); // addedlist 업데이트
  }
};

const removeFromAddedList = (item) => {
  selectedItems = selectedItems.filter((selectedItem) => selectedItem !== item);
  checkboxes.forEach((checkbox) => {
    if (checkbox.value == item) {
      checkbox.checked = false;
    }
  });
  renderAddedList(); // addedlist 업데이트
};

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
