.PHONY: play sync_scoreboard

DATE=$(shell date +%F)

play:
	@echo "** Preparing repo."
	git checkout master
	@echo
	@echo "** Running game."
	python run.py data.json
	make sync_scoreboard
	@echo
	@echo "** Commiting new scores."
	git add data.json README.md
	git commit -m 'Scores from $(DATE).'
	@echo
	@echo "** Done! Current standings:"
	python stats.py data.json

# Updates the statistics in the readme.
sync_scoreboard:
	@echo
	@echo "** Syncing scoreboard with game data."
	csplit -q README.md /Statistics/
	rm xx01
	mv xx00 README.md
	python stats.py data.json >> README.md
