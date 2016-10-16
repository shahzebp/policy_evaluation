all: clean
	-@ dac src/common.da
	-@ dac src/worker.da
	-@ dac src/coordinator.da
	-@ dac src/client.da
	-@ dac src/master.da
	-@ dac src/database.da

clean:
	-@ rm -rf src/*.py src/*pycache*
	-@ rm -rf log/ src/*.swp

run:
	dar src/master.da $(ARG)
