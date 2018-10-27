 let dom = {
    questionNum: 0,
    questionNumMax: 9,
    playerName: '',
    playerAnswerId: '',
    correctAnswerId: '',
    questionCategory: '',
    needToLearnCategory: [],

    loadBar: function() {
        let gameBar = document.getElementById('gameBar');
        gameBar.style.display = 'block'
    },

    loadBoard: function() {
        let gameBoard = document.getElementById('gameBoard');
        gameBoard.style.display = 'block'
    },

    updateProgress: function() {
        let progressBar = document.getElementById('progressBar');
        progressBar.style.width = '' + this.questionNum * 10 + '%'
    },

    loadQuestion: function() {


        dom.updateProgress();
        if (dom.questionNum >= 10) {
            dom.playerFeedback();
        } else {
            let questionField = document.getElementById('questionBody');
            fetch('/get-question/' + this.questionNum)
                .then(res => res.json())
                .then(data => {
                    questionField.innerHTML = data.message;
                    this.questionCategory = data.category;
                    fetch('/get-answers/' + data.id)
                        .then(resAnswers => resAnswers.json())
                        .then(answers => {
                            this.addAnswer(answers)
                        })
                });

        }

    },

    hideGame: function() {
        let gameBar = document.getElementById('gameBar');
        let gameBoard = document.getElementById('gameBoard');
        gameBar.style.display = 'none';
        gameBoard.style.display = 'none';
    },

    addAnswer: function(answers) {
        answers.answersShuffle();
        let answersBody = document.getElementById('answerContainer');
        answersBody.innerHTML = '';
        for (let i=0; i < answers.length; i++){
            let answerId = 'answer' + answers[i].id;
            answersBody.innerHTML += `<div class="answerTab" id=${answerId} > 
                                        <div class="answer"> ${answers[i].answer} 
                                        </div>
                                      </div>`;
            answersBody.lastChild.on('click', dom.markAnswer(answerId));
            //document.getElementById(answerId).addEventListener('click', this.markAnswer(answerId), true);
            if (answers[i].correct_answer) {
                this.correctAnswerId = answerId;
            }
        }
    },

    markAnswer: function(id) {

        this.playerAnswerId = id;
        document.getElementById(id).style.background = 'orange';
        let answers = document.getElementsByClassName('answerTab');
        for (let i = 0; i < answers.length; i++) {
            answers[i].off('click');
        }
        setTimeout(this.markCorrectAnswer, 700)
    },

    evaluatePlayerAnswer: function() {
      dom.questionNum += 1;
      if (dom.correctAnswerId !== dom.playerAnswerId) {
          dom.needToLearnCategory.push(dom.questionCategory);
          swal ( "Oops" ,  "You've answered wrong" ,  "error" )
              .then(dom.loadQuestion())
      }  else {
          swal ( "CONGratulations", "You've answered correctly", "success")
              .then(dom.loadQuestion())
      }
    },

    playerFeedback: function() {
        let feedbackMessage = '';
        dom.needToLearnCategory.removeRepetitions();
        let feedbackSkills = dom.needToLearnCategory;
        for (let i=0; i < feedbackSkills.length; i++) {
            feedbackMessage += 'You need to spend more time learning' + feedbackSkills[i] + '\n';
        }
        swal ( "You're Amazing, but:", feedbackMessage, "warning")
            .then(dom.hideGame())
    },

    markCorrectAnswer: function() {
        document.getElementById(dom.correctAnswerId).style.background = 'green';
        setTimeout(dom.evaluatePlayerAnswer, 400)
    },

    launchGame: function() {
        dom.needToLearnCategory = [];
        this.questionNum = 0;
        let modal = document.getElementById('myModal');
        this.playerName = document.getElementById('inputPlayerName').value;
        modal.style.display = 'none';
        this.loadBoard();
        this.loadBar();
        fetch('/set-questions')
            .then(res => this.loadQuestion());

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

Array.prototype.removeRepetitions= function() {
    let d = this.length -1;
    let i = this.sort();
    let x = 0;
    let z = 1;
    for (let y = 0; y < d; y ++) {
        if (i[z] === i[x]) {
            i.splice(x, 1)
        } else {
            x += 1;
            z += 1;
        }
    }
};