# echo "sudo shutdown -h now" | at now + 15minutes
# sudo pip3 install --upgrade tensorflow
# sudo pip3 install --upgrade keras
# python3 ~/data/mnist_test.py

# shutdown -h +60 | now+60min

sudo pip3 -y install -U keras
sudo pip3 -y install sklearn
sudo pip3 -y install pydot
sudo pip3 -y install graphviz

# # AWS cli
#source /vagrant/aws_configure.sh
#aws configure list
#aws s3 ls

# echo "Download Source Code"
git clone https://github.com/peace098beat/keras_audio_cnn.git /home/ubuntu/keras_audio_cnn

# echo "Download Datasets"
# # Download Datasets
# # wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairend+magna/mfcc_npy/NoSairen_mfcc_2000.npy ./
# # wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/audio-cnn-datasets/AudioCNN20170724/sairend+magna/mfcc_npy/OnSairen_mfcc_2000.npy ./
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/NoSairen_mell_100.npy /home/ubuntu/
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/OnSairen_mell_100.npy /home/ubuntu/
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/NoSairen_mell_10000.npy /home/ubuntu/
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/OnSairen_mell_10000.npy /home/ubuntu/
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/NoSairen_mell_15000.npy /home/ubuntu/
wget https://s3-us-west-2.amazonaws.com/nohara-dnn-workspace/dataset/OnSairen_mell_15000.npy /home/ubuntu/


mkdir /home/ubuntu/keras_audio_cnn/dataset/
cp /home/ubuntu/*.npy /home/ubuntu/keras_audio_cnn/dataset/

# echo "Analys Start .."
python3 /home/ubuntu/keras_audio_cnn/training-cnn2d.py -n 15000

