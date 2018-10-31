let dom = {
    questionNum: 0,
    questionNumMax: 9,
    playerName: '',
    playerAnswerId: '',
    correctAnswerId: '',
    questionCategory: '',
    needToLearnCategory: [],

    loadBar: function() {
        $('#gameBar').css('display','block')
    },

    loadBoard: function() {
        $('#gameBoard').css('display', 'block')
    },

    updateProgress: function() {
        $('#progressBar').css('width', dom.questionNum * 10 + '%')
    },

    loadQuestion: function() {
        dom.updateProgress();
        if (dom.questionNum >= 10) {
            dom.playerFeedback();
        } else {
            fetch('/get-question/' + dom.questionNum)
                .then(res => res.json())
                .then(data => {
                    $('#questionBody').html(data.message);
                    dom.questionCategory = data.category;
                    fetch('/get-answers/' + data.id)
                        .then(resAnswers => resAnswers.json())
                        .then(answers => {
                            dom.addAnswer(answers)
                        })
                });

        }

    },

    hideGame: function() {
        $('#gameBar, #gameBoard').css('display', 'none')
    },

    addAnswer: function(answers) {
        answers.answersShuffle();
        let answersBody = document.getElementById('answerContainer');
        answersBody.innerHTML = '';
        for (let i=0; i < answers.length; i++){
            let answerId = 'answer' + answers[i].id;
            answersBody.innerHTML += `<div class="answerTab" id=${answerId} onclick="dom.markAnswer('${answerId}')"> <div class="answer"> ${answers[i].answer} </div></div>`;
            if (answers[i].correct_answer) {
                this.correctAnswerId = answerId;
            }
        }
    },

    markAnswer: function(id) {

        dom.playerAnswerId = id;
        $('#'+id).css('background', 'orange');
        let answers = document.getElementsByClassName('answerTab');
        for (let i = 0; i < answers.length; i++) {
            answers[i].onclick = ''
        }
        setTimeout(dom.markCorrectAnswer, 700)
    },

    evaluatePlayerAnswer: function() {
      dom.questionNum += 1;
      if (dom.correctAnswerId !== dom.playerAnswerId) {
          dom.needToLearnCategory.push(dom.questionCategory);
          swal ( "Oops" ,  "You've answered wrong" ,  "error" )
              .then(dom.loadQuestion())
      }  else {
          swal ( "Gratulations", "You've answered correctly", "success")
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

    },
    loginToServer: function() {
        let userLogin = document.getElementById('login-user-name').value;
        let userPassword = document.getElementById('login-user-password').value;
        let data = {'username': userLogin, 'password': userPassword};
        fetch('/login', {
            method: "POST",
            headers: { "Content-Type": "application/json; charset=utf-8"},
            body: JSON.stringify(data)
        })
            .then(response => response.json())
            .then(data => {
                if (data == 'Accepted') {
                    $('#loginModal').modal("hide");

                } else {
                    return swal ( "Oops" ,  "Something went wrong!" ,  "error" )
                }
            })
    },
    modalToggle: function (modalId) {
        return $(modalId).modal("show")
    },
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