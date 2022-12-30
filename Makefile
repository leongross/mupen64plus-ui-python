COTNAINER_RT := docker
CONTAINER_TAG :=  mupen64plus-ui-python
LOCAL_MUPEN_GUI_PATH := ~/.local/bin/m64py

.PHONY: all container clean
all: ${LOCAL_MUPEN_GUI_PATH} container

${LOCAL_MUPEN_GUI_PATH}: requirements.txt
	pip install -r requirements.txt --user
	python setup.py build
	python setup.py install --user

container:
	${COTNAINER_RT} build . -f Containerfile -t ${CONTAINER_TAG}


clean:
	-${COTNAINER_RT} image rm ${CONTAINER_TAG}
