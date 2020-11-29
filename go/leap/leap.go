// Determine leap years
package leap

// IsLeapYear
func IsLeapYear(y int) bool {
	return (y%100 != 0 && y%4 == 0) || (y%400 == 0)
}
