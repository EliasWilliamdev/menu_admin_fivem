document.getElementById('btn-kick').addEventListener('click', () => {
    const playerId = document.getElementById('player-id').value;
    fetch(`https://${GetParentResourceName()}/kickPlayer`, {
        method: 'POST',
        body: JSON.stringify({ target: playerId })
    });
});