// add 10^9 to time
package gigasecond

// import path for the time package from the standard library
import (
	"math"
	"time"
)

// AddGigasecond add 10^9 to time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * time.Duration(int(math.Pow(10, 9))))
}
