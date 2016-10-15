all: clean
	-@ dac src/common.da
	-@ dac src/worker.da
	-@ dac src/coordinator.da
	-@ dac src/client.da
	-@ dac src/master.da
	-@ dac src/database.da

clean:
	-@ rm -rf *.py *pycache*
	-@ rm -rf log/ *.swp

run:
	-@ rm -rf log/ *.swp
	-@ mkdir log
	dar src/master.da $(ARG)
