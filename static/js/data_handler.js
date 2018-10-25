let data = {
    getQuestionsAndAnswers: function() {
        fetch('/get-questions')
            .then(res => res.json())
            .then(data => console.log(data))
    }
};