# echo "sudo shutdown -h now" | at now + 15minutes
# sudo pip3 install --upgrade tensorflow
# sudo pip3 install --upgrade keras
# python3 ~/data/mnist_test.py

shutdown -h +60

# # AWS cli
source /vagrant/aws_configure.sh

aws configure list
aws s3 ls

# echo "Download Source Code"
git clone https://github.com/peace098beat/keras_audio_cnn.git

# echo "Download Datasets"
# # Download Datasets
# # wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairend+magna/mfcc_npy/NoSairen_mfcc_2000.npy ./
# # wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairend+magna/mfcc_npy/OnSairen_mfcc_2000.npy ./
aws s3 cp s3://nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairen+magna/mell_npy/NoSairen_mell_500.npy ./
aws s3 cp s3://nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairen+magna/mell_npy/OnSairen_mell_500.npy ./

mkdir ~/keras_audio_cnn/sairen+magna/
cp ./*.npy ~/keras_audio_cnn/sairen+magna/

# echo "Analys Start .."
python3 ~/keras_audio_cnn/training-cnn2d.py

