package space

type Planet string

// Age return the planet age
func Age(second float64, planet Planet) float64 {
	planets_age := map[Planet]float64{
		"Earth":   1,
		"Mercury": 0.2408467,
		"Venus":   0.61519726,
		"Mars":    1.8808158,
		"Jupiter": 11.862615,
		"Saturn":  29.447498,
		"Uranus":  84.016846,
		"Neptune": 164.79132,
	}
	return second / (60 * 60 * 24 * 365.25 * planets_age[planet])
}
