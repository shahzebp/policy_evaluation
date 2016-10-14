all: clean
	-@ dac common.da
	-@ dac worker.da
	-@ dac coordinator.da
	-@ dac client.da
	-@ dac master.da
	-@ dac database.da

clean:
	-@ rm -rf *.py *pycache*
	-@ rm -rf log/ *.swp

run:
	-@ rm -rf log/ *.swp
	-@ mkdir log
	dar master.da config.ini
