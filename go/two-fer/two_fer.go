// Package twofer is classical: "One for X, one for me."
package twofer

import "fmt"

// ShareWith is twofer main function
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
