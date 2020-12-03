#[derive(Debug)]
pub struct Duration(f64);

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration(s as f64 / (60. * 60. * 24. * 365.25))
    }
}

pub trait Planet {
    fn period() -> f64 {
        unimplemented!("each Planet should implement this own period");
    }

    fn years_during(d: &Duration) -> f64 {
        return d.0 / Self::period();
    }
}

macro_rules! planet {
    ($planet_name:ident, $period:expr) => {
        pub struct $planet_name;
        impl Planet for $planet_name {
            fn period() -> f64 {
                $period
            }
        }
    };
}

planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Earth, 1.);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);
