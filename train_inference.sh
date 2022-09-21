#!/bin/bash


while getopts 'c:n:t:r:p' OPT; do
    case $OPT in
        c) cuda=$OPTARG;;
        n) name=$OPTARG;;
		    t) task=$OPTARG;;
        r) train="false";;
        p) predict="true";;
        
    esac
done
echo $name	


#if ${train}
#then
#
#	cd /data/cy/projects/nnFormer/nnformer/
#	CUDA_VISIBLE_DEVICES=${cuda} nnFormer_train 3d_fullres nnFormerTrainerV2_${name} ${task} 0
#fi

if ${predict}
then


	cd /data/cy/projects/DATASET/nnFormer_raw/nnFormer_raw_data/Task001_ACDC/
	CUDA_VISIBLE_DEVICES=0,1 nnFormer_predict -i imagesTs -o inferTs/${name} -m 3d_fullres -t ${task} -f 0 -chk model_best -tr nnFormerTrainerV2_${name}
	python /data/cy/projects/nnFormer/nnformer/inference_acdc.py ${name}
fi



