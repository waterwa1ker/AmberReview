all: change_filetype

change_filetype:
	amber change_filetype/solution.ab change_filetype/output.sh

clean:
	rm */*.sh
