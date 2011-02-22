package foo;

import static org.junit.Assert.*
import org.junit.Test

class FooTest {
  @Test
  def void foo() {
    def f = new Foo()
    System.out.println("foo")
  }
}
