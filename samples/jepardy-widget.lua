--[[

This script is getnerated by ChatGPT

Prompt:Search the internet for examples of scripts for AIO Launcher and write a script named "Jepardy" that will display a question from its database of questions with three answer options on the screen. If the answer is correct, a toast "Correct!" should appear on the screen, and a new question should be displayed. If the answer is incorrect, display a toast "Not correct" and present a new question. The database should contain questions in English.

--]]

-- A simplified structure for the questions database
local questions = {
    { question = "What is the capital of France?", answers = {"London", "Berlin", "Paris"}, correct = 3 },
    { question = "What element does 'O' represent on the periodic table?", answers = {"Gold", "Oxygen", "Osmium"}, correct = 2 },
    -- Add more questions to reach 100. Each question is a table with the question text,
    -- an array of answers, and the index of the correct answer in the array.
}

local currentQuestionIndex = 1 -- Track the current question

-- Function to display the current question and answers
function showCurrentQuestion()
    local q = questions[currentQuestionIndex]
    ui:show_lines({q.question, "1) " .. q.answers[1], "2) " .. q.answers[2], "3) " .. q.answers[3]})
end

-- Function to handle user's answer, check if it's correct, and move to the next question
function on_click(index)
    local correctAnswer = questions[currentQuestionIndex].correct + 1 -- Adjust for 1-based indexing
    if index == correctAnswer then
        ui:show_toast("Correct!")
    else
        ui:show_toast("Not correct")
    end

    -- Move to the next question, loop back to the first after the last question
    currentQuestionIndex = (currentQuestionIndex % #questions) + 1
    showCurrentQuestion()
end

-- Function called by AIO Launcher to resume the script/widget
function on_resume()
    showCurrentQuestion()
end

