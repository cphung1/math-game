class Question
  attr_accessor :question, :answer
  attr_reader :number1, :number2

  def question
    @number1 = Random.rand(1..20)
    @number2 = Random.rand(1..20)
    @question = "What is #{@number1} + #{@number2} ?"
  end

  def answer 
    @answer = @number1 + @number2
  end
end

# q1 = Question.new
# puts q1.question
# puts q1.answer

# q2 = Question.new
# puts q2.question
# puts q2.answer