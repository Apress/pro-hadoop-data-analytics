object Sorter {
  def sortRoutine(lst: List[Int]): List[Int] = {
    if (lst.length < 2)
      lst
    else {
      val pivel = lst(lst.length / 2)
      sortRoutine(lst.filter(_ < pivel)) :::
           lst.filter(_ == pivel) :::
           sortRoutine(lst.filter(_ > pivel))
    }
  }
  
  def main(args: Array[String]) {
    val examplelist = List(11,14,100,1,99,5,7)
    println(examplelist)
    println(sortRoutine(examplelist))
  }
}
