let Open = false;

function OpenAchievements(Achievements) {
    if (!Array.isArray(Achievements)) {
        console.log('Details of received object:', JSON.stringify(Achievements, null, 2));
        return; 
    }
    
    Achievements.sort((a, b) => a.title.localeCompare(b.title));

    const tableBody = document.querySelector('.achievements-table tbody');
    tableBody.innerHTML = ''; 

    Achievements.forEach(achievement => {
        const row = createAchievementRow(achievement);
        tableBody.appendChild(row);
    });

    const wrapper = document.querySelector('.achievements-wrapper');
    wrapper.style.display = 'flex';
    Open = true;
}

function DisplayNotification(imageFilename, title, timer) {
    const notification = document.getElementById('achievement-notification');
    const img = document.getElementById('achievement-image');
    const titleElement = document.getElementById('achievement-title');

    img.src = imageFilename ? `images/${imageFilename}` : "images/default_achievement.png";

    titleElement.textContent = title;

    notification.style.display = 'block';

    setTimeout(() => {
        notification.style.display = 'none';
    }, timer);
}

function createAchievementRow(achievement) {
    const imageUrl = achievement.imgSrc ? `images/${achievement.imgSrc}` : "images/default_achievement.png";
    const progress = achievement.isCompleted ? "Complete" : `${achievement.currentValue} / ${achievement.valueNeeded}`;

    const row = document.createElement('tr');
    row.className = achievement.isCompleted ? 'completed' : '';
    row.innerHTML = `
        <td class="achievements-data"><img class="achievement-icon" src="${imageUrl}" alt="${achievement.title}"></td>
        <td class="achievements-data">${achievement.title}</td>
        <td class="achievements-data">${achievement.description}</td>
        <td class="achievements-data">${progress}</td>
    `;
    return row;
}

function CloseUI() {
    const wrapper = document.querySelector('.achievements-wrapper');
    wrapper.style.display = 'none';

    
    const data = JSON.stringify({ close: true });

    Open = false;
    
    if (!navigator.sendBeacon('https://ns-achievements/close-ui', data)) {
        console.error('Beacon send failed.');
    }
}

document.addEventListener("keyup", function(press) {
    let key_pressed = press.key;
    let valid_keys = ['Escape'];
  
    if (valid_keys.includes(key_pressed) && Open) {
        switch (key_pressed) {
            case 'Escape':
                CloseUI()
                break;
        }
    }
});

document.getElementById('closeUiButton').addEventListener('click', CloseUI);

window.addEventListener('message', (event) => {
    if (event.data.action === 'open-achievements') {
        OpenAchievements(event.data.Achievements);
    } else if (event.data.action === "achievement-earned") {
        DisplayNotification(event.data.Image, event.data.Title, event.data.Timer);
    }
});