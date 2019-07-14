#/bin/sh

size=20g

fio --name=FILL_FILE --filename=/opt/test_file.bin --bs=128k --iodepth=32 --rw=write --ioengine=libaio --direct=1 --size=$size

fio --name=RandWrite_4k_1 --filename=/opt/test_file.bin --bs=4k --iodepth=32 --rw=randwrite --ioengine=libaio --direct=1 --size=$size

fio --name=RandRead_4k_1 --filename=/opt/test_file.bin --bs=4k --iodepth=32 --rw=randread --ioengine=libaio --direct=1 --size=$size

fio --name=RandWrite_128k_128 --filename=/opt/test_file.bin --bs=128k --iodepth=128 --rw=randwrite --ioengine=libaio --direct=1 --size=$size

fio --name=RandRead_128k_128 --filename=/opt/test_file.bin --bs=128k --iodepth=128 --rw=randread --ioengine=libaio --direct=1 --size=$size

