
MASTER_IP=$(ifconfig ens33 | grep "netmask" | awk '$1=$1'| cut -d " " -f 2)

kubeadm init \
--kubernetes-version 1.18.0 \
--image-repository registry.aliyuncs.com/google_containers \
--apiserver-advertise-address ${MASTER_IP} \
--pod-network-cidr=10.244.0.0/16 \
--token-ttl 0 \
--ignore-preflight-errors=all


echo "安装calico-3.13.1"
#rm -f calico-3.13.1.yaml
#wget https://kuboard.cn/install-script/calico/calico-3.13.1.yaml
kubectl apply -f calico-3.13.1.yaml
