function showTab(tabId) {
    var tabs = document.querySelectorAll('.tab');
    var contents = document.querySelectorAll('.tab-content');

    tabs.forEach(function(tab) {
        tab.classList.remove('active');
    });

    contents.forEach(function(content) {
        content.classList.remove('active');
    });

    document.getElementById(tabId).classList.add('active');
    document.querySelector('.tab[onclick="showTab(\'' + tabId + '\')"]').classList.add('active');
}