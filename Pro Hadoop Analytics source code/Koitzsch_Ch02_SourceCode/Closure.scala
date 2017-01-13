def closure1(): Int => Int = {
      val next = 1
      def addit(x: Int) = x + next
      addit
      }

 def closure2() = {
      val y = 2
      val f = closure1()
      println(f(100))
      }
