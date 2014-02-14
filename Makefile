.PHONY: play scoreboard clean

DATE=$(shell date +%F)

play:
	git checkout master
	python run.py data.json
	make clean
	make scoreboard
	git add data.json README.md
	git commit -m 'Scores from $(DATE).'

# Paste the statistics at the end of the readme.
scoreboard:
	python stats.py data.json >> README.md
	cat README.md

# Removes the statistics from the readme.
clean:
	csplit -q README.md /Statistics/
	rm xx01
	mv xx00 README.md
