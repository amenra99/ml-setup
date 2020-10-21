sudo apt-get update
sudo apt-get -Y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common\
    wget\
    #docker\
    module-init-tools\
    kmod\
    apt-utils\
    git\
    python3\
    python3-pip\
    bash\
    scp\
    gcc\
    make\

python3 -m pip install --no-cache-dir --upgrade pip && \
python3 -m pip install --no-cache-dir \
    jupyter \
    tensorflow \
    torch \
    numpy

#NVIDIA driver
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/450.80.02/NVIDIA-Linux-x86_64-450.80.02.run
sh NVIDIA-Linux-x86_64-450.80.02.run

#Docker 설치 https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
curl https://get.docker.com | sh
sudo systemctl start docker && sudo systemctl enable docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2

#sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi


#User docker 사용자 등록
sudo usermod -aG docker your-user


#ML Repository
mkdir repository
cd repository
git clone https://github.com/google-research/bert   #Bert
git clone https://github.com/kpe/bert-for-tf2.git
git clone https://github.com/google-research/electra    #electra
git clone https://github.com/google-research/albert #alberta
git clone https://github.com/google-research/text-to-text-transfer-transformer.git  #T5
git clone https://github.com/pytorch/fairseq    #RoBERTa
git clone https://github.com/openai/gpt-2.git   #GPT-2

git clone https://github.com/huggingface/transformers.git   #Huggingface Transformer
git clone https://github.com/huggingface/tokenizers.git     #Huggingface Tokenizers
git clone https://github.com/huggingface/datasets.git   #Huggingface Dataset

git clone https://github.com/NVIDIA/apex


#docker images
docker build ./transformers/docker/transformers-gpu
docker pull nvidia/cuda:11.0-base nvidia-smi
docker pull nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
#docker pull huggingface/transformers-tensorflow-gpu
#docker pull huggingface/transformers-pytorch-gpu
docker pull jenkins
docker pull redmine
docker pull mysql
docker pull postgres
docker pull nginx

https://github.com/huggingface/transformers/blob/master/docker/transformers-gpu/Dockerfile

pip install transformers
pip install datasets
