package hamming

import (
	"errors"
)

// Distance between 2 strands
func Distance(a, b string) (int, error) {
	var lenA = len(a)
	if lenA != len(b) {
		return -1, errors.New("strand should have the same longer")
	}

	var ct = 0
	for i := 0; i < lenA; i++ {
		if a[i] != b[i] {
			ct++
		}
	}
	return ct, nil
}
