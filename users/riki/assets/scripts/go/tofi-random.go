package main

import (
	"fmt"
	"math/rand"
)

func main() {
	items := []string{
		"Are you sure?   ~Omniman",
		"Shut up and take my money!   ~Fry",
		"I am the one who knocks!   ~Walter White",
		"It's over 9000!   ~Vegeta",
		"Let me in!   ~Eric André",
		"It's a trap!   ~Admiral Ackbar",
		"Identity theft is not a joke, Jim!   ~Dwight Shrute",
		"Coincidence? I think not!   ~Bernie Kropp",
		"What if I told you...   ~Morpheus",
		"Nani??   ~Anime Character",
		"Za Warudo!!   ~Dio Brando",
		"We are number one!   ~Robbie Rotten",
		"It's over Anakin, I have the high ground!   ~Obi-Wan Kenobi",
		"One does not simply walk into Mordor.   ~Boromir",
		"I am once again asking for your financial support.   ~Bernie Sanders",
		"It's not a bug, it's a feature.   ~Every Developer",
		"Ogres are like onions... we both have layers.   ~Shrek",
		"Some of you may die, but it's a sacrifice I am willing to make.   ~Lord Farquaad",
		"No capes!   ~Edna Mode",
		"Where's my super suit?!   ~Frozone",
		"Smile and wave, boys. Smile and wave.   ~Skipper",
		"Skadoosh.   ~Po",
		"I am a real cop, I am a real cop...   ~Judy Hopps",
		"I'm not a regular cat, I'm a cool cat.   ~Puss in Boots",
		"My precious!   ~Gollum",
		"I'm surrounded by idiots.   ~Scar",
		"Do you know the muffin man?   ~Gingy",
		"Cool, cool, cool, cool, cool. No doubt, no doubt, no doubt.   ~Jake Peralta",
		"You're under arrest for ruining something perfect!   ~Rosa Diaz",
		"Sarge, with all due respect, I am gonna completely ignore everything you just said.   ~Jake Peralta",
		"Captain Wuntch. Good to see you. But if you're here, who's guarding Hades?   ~Captain Holt",
		"Meep Morp... Zeep.   ~Captain Holt",
	}

	i := rand.Intn(len(items))
	fmt.Print(items[i])
}
