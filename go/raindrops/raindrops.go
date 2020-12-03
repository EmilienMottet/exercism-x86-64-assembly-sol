package raindrops

import "strconv"

// Convert an integer into a raindrops
func Convert(n int) string {
	rains := map[int]string{3: "Pling", 5: "Plang", 7: "Plong"}
	res := ""
	for k, v := range rains {
		if n%k == 0 {
			res += v
		}
	}

	if res == "" {
		return strconv.Itoa(n)
	} else {
		return res
	}
}
