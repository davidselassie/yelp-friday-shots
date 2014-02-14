.PHONY: play scoreboard clean

play:

# Paste the statistics at the end of the readme.
scoreboard:
	python stats.py data.json >> README.md
	cat README.md

# Removes the statistics from the readme.
clean:
	csplit -q README.md /Statistics/
	rm xx01
	mv xx00 README.md
