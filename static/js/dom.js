let dom = {
    loadBar: function() {
        let gameBar = document.getElementById('gameBar');
        gameBar.style.display = 'block'
    },

    loadBoard: function() {
        let gameBoard = document.getElementById('gameBoard');
        gameBoard.style.display = 'block'
    },

    hideGame: function() {
        let gameBar = document.getElementById('gameBar');
        let gameBoard = document.getElementById('gameBoard');
        gameBar.style.display = 'none';
        gameBoard.style.display = 'none';
    },

    addAnswer: function(answers) {
        answers.answersShuffle()
        let answersBody = document.getElementById('answerContainer');
        for (let i=0; i < answers.length; i++){
            answersBody.innerHTML += `<div> ${answers[i]} </div>`
        }
    }
};

Array.prototype.answersShuffle = function () {
            let i = this.length, j, temp;
            while (--i > 0) {
                j = Math.floor(Math.random() * (i + 1));
                temp = this[j];
                this[j] = this[i];
                this[i] = temp;
            }
        };