FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

RUN apt-key del 7fa2af80 && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git

RUN conda install -y ipython
RUN pip install ninja yacs cython matplotlib tqdm scipy torchsampler scikit-image opencv-python numpy sklearn pillow argparse 

RUN git clone https://github.com/cocodataset/cocoapi.git \
 && cd cocoapi/PythonAPI \
 && python setup.py build_ext install
