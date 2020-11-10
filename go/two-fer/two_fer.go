// Classical: "One for X, one for me."
package twofer

import "fmt"

// twofer main function
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
