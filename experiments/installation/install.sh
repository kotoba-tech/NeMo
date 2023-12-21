#!/bin/bash
#$ -l rt_AF=1
#$ -l h_rt=10:00:00
#$ -j y
#$ -o outputs/install/
#$ -cwd

# module load
source /etc/profile.d/modules.sh
module load cuda/11.8/11.8.0
module load cudnn/8.9/8.9.2
module load nccl/2.16/2.16.2-1
module load hpcx/2.12

# pip update
pip install --upgrade pip

# install packages
pip install torch --index-url https://download.pytorch.org/whl/cu118

pip install wheel packaging
pip install ninja

pip install -r requirements/requirements.txt

pip install flash-attn --no-build-isolation

pip install Cython

pip install -r requirements/requirements_asr.txt
pip install -r requirements/requirements_common.txt
pip install -r requirements/requirements_nlp.txt
pip install -r requirements/requirements_tts.txt
