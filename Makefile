clean:
	rm -rf *.py *pycache* *.log

all: clean
	dac common.da
	dac worker.da
	dac coordinator.da
	dac client.da
	dac master.da
	dac database.da
run:
	dar master.da config.ini
