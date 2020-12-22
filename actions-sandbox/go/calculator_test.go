package calculator

import (
	"testing"
)

/*
ref link: https://golang.hateblo.jp/entry/golang-testing
---------------------------------
$ go test -v

=== RUN   TestAdd
--- PASS: TestAdd (0.00s)
=== RUN   TestSubtract
--- PASS: TestSubtract (0.00s)
PASS
ok      _/.../go   0.004s
---------------------------------
*/

func TestAdd(t *testing.T) {
  expect := 3
  actual := add(2,1)
  if actual != expect {
    t.Errorf("actual: %v, expected: %v", actual, expect)
  }
}

func TestSubtract(t *testing.T) {
  expect := 1
  actual := subtract(2,1)
  if actual != expect {
    t.Errorf("actual: %v, expected: %v", actual, expect)
  }
}
