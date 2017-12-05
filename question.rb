class Question
  
      def initialize
        @val_one = Random.rand(1..20)
        @val_two = Random.rand(1..20)
        @answer = @val_one + @val_two
      end
  
      def question
        "#{@val_one} plus #{@val_two} equals?"
      end
  
      def correct?(answer)
        answer == @answer
      end
  
  
end
  