all: clean
	-@ dac common.da
	-@ dac worker.da
	-@ dac coordinator.da
	-@ dac client.da
	-@ dac master.da
	-@ dac database.da

clean:
	-@ rm -rf *.py *pycache*
	-@ rm -f *.log *.swp

run:
	-@ rm -f *.log *.swp
	dar master.da config.ini
