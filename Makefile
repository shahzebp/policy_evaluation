all: clean
	-@ dac common.da
	-@ dac worker.da
	-@ dac coordinator.da
	-@ dac client.da
	-@ dac master.da
	-@ dac database.da

clean:
	-@ rm -rf *.py *pycache*
	-@ rm -f *.log

run:
	dar master.da config.ini
