function openCustomizer(model) {
    const iframe = document.getElementById('customizerFrame');
    if (iframe) {
        // Set iframe URL based on the selected model, and prevent cache by adding a timestamp
        if (model === 'model1') {
            iframe.src = `http://localhost:3000/index.html?model=${model}&timestamp=${new Date().getTime()}`;
        } else if (model === 'model2') {
            iframe.src = `http://localhost:3002/index.html?model=${model}&timestamp=${new Date().getTime()}`;
        }
        // Display the modal
        document.getElementById('customizerModal').style.display = 'flex';
    } else {
        console.error('Iframe with id customizerFrame not found');
    }
}

function closeCustomizer() {
    const modal = document.getElementById('customizerModal');
    const iframe = document.getElementById('customizerFrame');

    if (modal) {
        modal.style.display = 'none';  // Close the modal
    }

    if (iframe) {
        iframe.src = '';  // Clear the iframe source to stop rendering
    } else {
        console.error('Iframe with id customizerFrame not found');
    }
}
